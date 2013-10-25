package com.eleyuan.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

public class MD5 {
	/**
	 * 利用MD5进行加密
	 * 
	 * @param str待加密的字符串
	 * @return 加密后的字符串
	 * @throws NoSuchAlgorithmException没有这种产生消息摘要的算法
	 * 
	 * @throws UnsupportedEncodingException
	 */
	public static String encoderByMd5(String str) {
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5"); // 确定计算方法
			BASE64Encoder base64en = new BASE64Encoder();
			return base64en.encode(md5.digest(str.getBytes("utf-8")));// 返回加密后的字符串
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}
}
