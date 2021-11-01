package com.paulzhang;

import com.paulzhang.socket.NettyServerHandler;
import com.paulzhang.socket.NumberFormatException;
import org.apache.commons.codec.binary.Hex;

import java.util.Arrays;

public class Test {

	public static void main(String[] args) {

		byte[] bb = {0x01, 0x03, 0x04, 0x03, 0x20, 0x00, 0x65, 0x3b, (byte) 0x96};
		byte[] bs = Arrays.copyOfRange(bb, 5, 7);//{(byte) 0x00, 0x65};
		String s = Hex.encodeHexString(bs);
		System.out.println(s);

		long l = parseLong(s, 16);

		System.out.println(l);

		float oxygen = Float.intBitsToFloat((int) l);

		System.out.println(oxygen);


	}


	public static long parseLong(String s, int radix) throws NumberFormatException {
		if (s == null) {
			throw new NumberFormatException("null");
		}

		if (radix < Character.MIN_RADIX) {
			throw new NumberFormatException("radix " + radix + " less than Character.MIN_RADIX");
		}
		if (radix > Character.MAX_RADIX) {
			throw new NumberFormatException("radix " + radix + " greater than Character.MAX_RADIX");
		}

		long result = 0;
		boolean negative = false;
		int i = 0, len = s.length();
		long limit = -Long.MAX_VALUE;
		long multmin;
		int digit;

		if (len > 0) {
			char firstChar = s.charAt(0);
			if (firstChar < '0') { // Possible leading "+" or "-"
				if (firstChar == '-') {
					negative = true;
					limit = Long.MIN_VALUE;
				} else if (firstChar != '+')
					throw NumberFormatException.forInputString(s);

				if (len == 1) // Cannot have lone "+" or "-"
					throw NumberFormatException.forInputString(s);
				i++;
			}
			multmin = limit / radix;
			while (i < len) {
				// Accumulating negatively avoids surprises near MAX_VALUE
				digit = Character.digit(s.charAt(i++), radix);
				if (digit < 0) {
					throw NumberFormatException.forInputString(s);
				}
				if (result < multmin) {
					throw NumberFormatException.forInputString(s);
				}
				result *= radix;
				if (result < limit + digit) {
					throw NumberFormatException.forInputString(s);
				}
				result -= digit;
			}
		} else {
			throw NumberFormatException.forInputString(s);
		}
		return negative ? result : -result;
	}
}
