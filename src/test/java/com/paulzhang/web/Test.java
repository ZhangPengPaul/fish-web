package com.paulzhang.web;

import org.apache.commons.codec.binary.BinaryCodec;
import org.apache.shiro.codec.Hex;
import org.apache.shiro.crypto.hash.SimpleHash;

public class Test {

	public static void main(String[] args) {
//		String hashedPassword = new SimpleHash("md5", "12345", "5371f568a45e5ab1f442c38e0932aef24447139bzhangsan5371f568a45e5ab1f442c38e0932aef24447139b", 1024).toString();
//		System.out.println(hashedPassword);

		byte[] b = Hex.decode("A0");
		System.out.println(b.length);

		System.out.println(Hex.encodeToString(b));
	}
}
