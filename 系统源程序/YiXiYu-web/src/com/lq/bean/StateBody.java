package com.lq.bean;

/**
 * @author 李秦
 * @version V1.0
 * @Package com.lq.bean
 * @date 2021-03-20 22:19
 * @Copyright © 2020-2021
 */
public class StateBody
{
	private Object data;

	public StateBody(Object data) {
		this.data = data;
	}

	public void setData(Object data) {

		this.data = data;
	}

	public StateBody() {
	}

	public Object getData() {

		return data;
	}
}
