package com.lq.service.android;

import java.io.UnsupportedEncodingException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Random;

/**
 * @author 李秦
 * @version V1.0
 * @Package com.lq.service.android
 * @date 2021-04-09 20:12
 * @Copyright © 2020-2021
 */
public class RandomName {
	public static String GetNickName() {
		/**随机产生100个昵称*/
		HashSet<String> set = new HashSet<String>();
		for (int i = 0; i < 1; i++) {
			String chineseName1 = getRandomJianHan(2);
			String chineseName2 = getRandomJianHan(2);
			String chineseName = chineseName1+"的"+chineseName2;
			if (!set.contains(chineseName)) {
				set.add(chineseName);
			}
		}
		Iterator<String> iterator = set.iterator();
		while (iterator.hasNext()) {
			return iterator.next();
		}
		return iterator.next();
	}

	public static String getRandomJianHan(int len) {
		String randomName = "";
		for (int i = 0; i < len; i++) {
			String str = null;
			int hightPos, lowPos; // 定义高低位
			Random random = new Random();
			hightPos = (176 + Math.abs(random.nextInt(39))); // 获取高位值
			lowPos = (161 + Math.abs(random.nextInt(93))); // 获取低位值
			byte[] b = new byte[2];
			b[0] = (new Integer(hightPos).byteValue());
			b[1] = (new Integer(lowPos).byteValue());
			try {
				str = new String(b, "GBK"); // 转成中文
			} catch (UnsupportedEncodingException ex) {
				ex.printStackTrace();
			}
			randomName += str;
		}
		return randomName;
	}
}
