package com.yixiyu.lq.yixiyuandroid_customer.Main;

import android.content.res.TypedArray;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.GridView;
import android.widget.ListView;
import android.widget.TextView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.yixiyu.lq.yixiyuandroid_customer.bean.RestBillOfFare;
import com.yixiyu.lq.yixiyuandroid_customer.service.Basic;
import com.yixiyu.lq.yixiyuandroid_customer.service.widget.ViewPagerIndicator;
import com.yixiyu.lq.yixiyuandroid_customer.R;
import com.yixiyu.lq.yixiyuandroid_customer.bean.ContantsPool;
import com.yixiyu.lq.yixiyuandroid_customer.bean.HomeIconInfo;
import com.yixiyu.lq.yixiyuandroid_customer.service.adapter.*;
import com.yixiyu.lq.yixiyuandroid_customer.service.nohttp.*;
import com.yolanda.nohttp.NoHttp;
import com.yolanda.nohttp.RequestMethod;
import com.yolanda.nohttp.rest.Request;
import com.yolanda.nohttp.rest.Response;

import java.util.ArrayList;
import java.util.List;

import butterknife.ButterKnife;
import butterknife.InjectView;
//菜单片段

public class Sort_Fragment extends Fragment implements ContantsPool, HttpListner<String>
{

//    private View sort = LayoutInflater.from(getActivity()).inflate(R.layout.fragment_sort_, null);
    private View inflat;
    @InjectView(R.id.listView_sort)
    ListView mListView;
    private ViewPagerIndicator mIndicator;
    Basic basic=new Basic();
    private List<String> mData = new ArrayList<>();
    private List<View> mViews = new ArrayList<>();
    /**
     * gridView的数据
     */
    private List<HomeIconInfo> mPagerOneData = new ArrayList<>();
    private List<HomeIconInfo> mPagerTwoData = new ArrayList<>();

    /**自定义的菜品存放容器**/
    List<RestBillOfFare> mVegetablelist = new ArrayList<>();

    public Sort_Fragment()
    {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState)
    {
        //防止重新加载数据
        if (inflat == null){

            inflat=inflater.inflate(R.layout.fragment_sort_, container, false);
            ButterKnife.inject(this, inflat);
            initData();
            initView();
        }

        // Inflate the layout for this fragment
        return inflat;

    }


    /***
     * 初始化gridview的数据导入sort_arrays中数据
     * 名字，图片
     */
    private void initData() {
        String[] iconName = getResources().getStringArray(R.array.sort_labels);
        TypedArray typedArray = getResources().obtainTypedArray(R.array.sort_icon);
        System.out.println(iconName.length);
        for (int i = 0; i < iconName.length; i++) {
            if (i < 6) {
                mPagerOneData.add(new HomeIconInfo(iconName[i], typedArray.getResourceId(i, 0)));
            } else {
                mPagerTwoData.add(new HomeIconInfo(iconName[i], typedArray.getResourceId(i, 0)));
            }
        }
        /**菜单的请求**/
        String spRecommendURL= baseUrl+"/SortServlet?action=ShowVegetables";
        Request<String> recommendRequest = NoHttp.createStringRequest(spRecommendURL, RequestMethod.GET);
        CallServer.getRequestInstance().add(getActivity(),0,recommendRequest,this,true,true);
    }

    public void initView(){
        mListView=inflat.findViewById(R.id.listView_sort);
        View headView = getLayoutInflater().from(getActivity()).inflate(R.layout.sort_headviewall, null);
        mIndicator = (ViewPagerIndicator) headView.findViewById(R.id.indicator);
        ViewPager viewPager_sort = (ViewPager) headView.findViewById(R.id.viewPager_sort);
        viewPager_sort.addOnPageChangeListener(new MyPagerListner(mIndicator));
        /*
        * 初始化gridView数据
        * */
        View sort_page_one=LayoutInflater.from(getActivity()).inflate(R.layout.sort_gridview, null);
        GridView gridView01 = (GridView) sort_page_one.findViewById(R.id.sort_gv);
        gridView01.setAdapter(new MyGridAdapter(mPagerOneData,getActivity()));
        gridView01.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {

            }
        });

        View sort_page_two=LayoutInflater.from(getActivity()).inflate(R.layout.sort_gridview, null);
        GridView gridView02 = (GridView) sort_page_two.findViewById(R.id.sort_gv);
        gridView02.setAdapter(new MyGridAdapter(mPagerTwoData,getActivity()));
        gridView02.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {

            }
        });
        mViews.add(sort_page_one);
        mViews.add(sort_page_two);
        viewPager_sort.setAdapter(new MyPagerAdapter(mViews));
        //添加listview的头部
        mListView.addHeaderView(headView);
        MyVegetableAdapter myAdapter = new MyVegetableAdapter(mVegetablelist);

        mListView.setAdapter(myAdapter);
    }

    class MyVegetableAdapter extends CommenAdapter
    {
        public MyVegetableAdapter(List data) {
            super(data);
        }

        @Override
        public View getView(int position, View convertView, ViewGroup viewGroup) {

            ViewHolder holder = ViewHolder.get(getActivity(),R.layout.sort_vegetable_item,convertView, viewGroup);
            //商品子视图
            TextView tvTitle = holder.getView(R.id.name_type);
            tvTitle.setText(mVegetablelist.get(position).getVegetableName()+"("+mVegetablelist.get(position).getVegetableType()+")");
            TextView tvRemark= holder.getView(R.id.remark);
            tvRemark.setText(mVegetablelist.get(position).getVegetableRemark());
            TextView tvPrice=holder.getView(R.id.price);
            tvPrice.setText(mVegetablelist.get(position).getVegetablePrice());
            TextView tvNumber=holder.getView(R.id.number);
            tvNumber.setText(mVegetablelist.get(position).getVegetableNumber()+"份");
//            Uri uri = Uri.parse(mDatalist.get(position).getImages().get(0).getImage());
//            SimpleDraweeView draweeView = holder.getView(R.id.iv_icon2);
//            draweeView.setImageURI(uri);

            return holder.getConvertView();
        }
    }

    @Override
    public void OnSucceed(int what, Response<String> response)
    {
        switch (what){
            case 0:
                Gson gson = new Gson();
//                GoodsInfo goodsInfo = gson.fromJson(response.get(), GoodsInfo.class);
//                GoodsInfo goodsInfo =basic.fromToJson(response.get(),new TypeToken<List<RestBillOfFare>>(){}.getType());
//                List<RestBillOfFare> goodlist =goodsInfo.getResult().getGoodlist();
                List<RestBillOfFare> goodlist =basic.fromToJson(response.get(),new TypeToken<List<RestBillOfFare>>(){}.getType());
                mVegetablelist.addAll(goodlist);
                break;
        }
    }

    @Override
    public void onFailed(int what, String url, Object tag, CharSequence message, int responseCode, long networkMillis)
    {

    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        ButterKnife.reset(this);
    }
}