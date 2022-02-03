package com.lq.bean;

/**
 * @author 李秦
 * @version V1.0
 * @Package com.lq.bean
 * @date 2021-05-28 11:31
 * @Copyright © 2020-2021
 */
public class Analyze {
	private String name;
	private String num;

	public Analyze(String name, String num) {
		this.name = name;
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return "Analyze{" + "name='" + name + '\'' + ", num='" + num + '\'' + '}';
	}
}
