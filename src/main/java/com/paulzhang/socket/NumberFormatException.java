package com.paulzhang.socket;

public class NumberFormatException extends IllegalArgumentException {

	public NumberFormatException(String s) {
		super(s);
	}

	static NumberFormatException forInputString(String s) {
		return new NumberFormatException("For input string: \"" + s + "\"");
	}
}
