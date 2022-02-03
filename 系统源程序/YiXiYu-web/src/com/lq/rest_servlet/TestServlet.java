package com.lq.rest_servlet;

import com.google.gson.Gson;
import com.lq.bean.RestStaffBasicForm;
import com.lq.service.Staff;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "TestServlet",urlPatterns="/TestServlet")
public class TestServlet extends BaseServlet{
//    private static final long serialVersionUID = 1L;
    Gson gson=new Gson();
	Staff staff=new Staff();
	RestStaffBasicForm restStaffBasicForm=null;
    protected void doShow(HttpServletRequest request, HttpServletResponse response)
		throws ServletException,IOException{
		System.out.println("运行doShow");
		String status=null;
		String staff_id=request.getParameter("staff_id");

	}
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        // 1.设置参数编码
//        request.setCharacterEncoding("UTF-8");
//        // 设置响应数据字符集
//        response.setCharacterEncoding("UTF-8");
//        // 设置响应数据格式
//        // response.setContentType("application/json; charset=UTF-8");
//        PrintWriter out = response.getWriter();
//        // 2.创建文件上传处理工厂
//        DiskFileItemFactory factory = new DiskFileItemFactory();
//        // 3.设置临时文件存放地点
//        // 3.1获取当前web应用程序对象（WEB容器在启动时，它会为每个WEB应用程序都创建一个对应的ServletContext对象，它代表当前web应用）
//        ServletContext servletContext = this.getServletConfig().getServletContext();
//        // 3.2获取服务器的临时目录（tomcat、WebLogic）
//        // D:\ProgramFiles(x86)\APACHE\TOMCAT\apache-tomcat-7.0.40-x86\work\Catalina\localhost\demo
//        File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
//        System.out.println("临时目录："+repository);
//        // 3.3临时文件将会存储在该目录下
//        factory.setRepository(repository);
//        // 4.创建文件上传处理器
//        ServletFileUpload upload = new ServletFileUpload(factory);
//        // 5.判断请求类型是否为文件上传类型
//        boolean multipartContent = upload.isMultipartContent(request);
//
//        Map<String, String> mapData = new HashMap<String, String>();
//        // 返回信息
//        String msg = "";
//        // 错误信息
//        String errorMsg = "";
//        // 文件名
//        String fileName = "";
//        if (multipartContent) {
//            try {
//                // 获取请求参数
//                String param = request.getParameter("param1");
//                System.out.println(param);
//                // 6.解析请求信息
//                List<FileItem> items = upload.parseRequest(request);
//
//                // 7.对所有请求信息进行判断
//                Iterator<FileItem> iter = items.iterator();
//                while (iter.hasNext()) {
//                    FileItem item = iter.next();
//                    // 信息为文件格式
//                    if (!item.isFormField()) {
//                        fileName = processUploadedFile(param, item);
//                        msg = "上传成功！";
//                    }
//                }
//            } catch (FileUploadException e) {
//                e.printStackTrace();
//                msg = "上传失败！";
//                errorMsg = e.getMessage();
//            }
//
//        } else {
//            msg = "form表单类型不是multipart/form-data，无法上传！";
//        }
//
//        mapData.put("msg", msg);
//        mapData.put("errorMsg", errorMsg);
//        mapData.put("fileName", fileName);
//        // 将Map转成JSON
//        String resultJson=gson.toJson(mapData);
//        // 返回客户端信息
//        out.print(resultJson.toString());
//        response.getWriter().write(resultJson);
//    }
//
//    /**
//     * 处理上传的文件
//     */
//    private String processUploadedFile(String param, FileItem item) {
//        // Process a file upload
//        String fieldName = item.getFieldName();// 默认值为Filedata
//        // 获取文件名
//        String fileName = item.getName();
//        // 内容类型：application/octet-stream
//        String contentType = item.getContentType();
//        boolean isInMemory = item.isInMemory();
//        // 获取文件大小
//        long sizeInBytes = item.getSize();
//        // 1.指定文件上传的根路径
//        String path = this.getServletContext().getRealPath("/WEB-INF/uploadFiles");
//        // 2.路径构成：/uploadfile/fileName
//        // TODO 可以自定义文件存放路径
//        // 3.根据路径批量创建文件夹
//        File fileDirectories = new File(path);
//        // 目录不存在时，再创建
//        if (!fileDirectories.exists()) {
//            fileDirectories.mkdirs();// 所有的文件夹都创建成功才返回TRUE
//        }
//        // 4.文件名格式校验（文件名中不能包含#号）
//        int index = fileName.indexOf("#");
//        if (index > -1) {
//            fileName = fileName.replace('#', '_');
//        }
//        // TODO 可以对文件名进行重命名
//        // 5.在指定路径下创建指定名称的文件
//        File uploadedFile = new File(path + "/" + fileName);
//        // 6.判断该文件是否已存在
//        if (!uploadedFile.exists()) {
//            try {
//                // 使用了这个方法写入文件，临时文件会被系统自动删除
//                item.write(uploadedFile);
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//        // 返回重名后的文件名
//        return fileName;
//    }
//
//    /**
//     * 处理信息为普通的格式
//     * @param item
//     */
//    private void processFormField(FileItem item) {
//        // Process a regular form field
//        if (item.isFormField()) {
//            String name = item.getFieldName();
//            String value = item.getString();
//        }
//    }

}
