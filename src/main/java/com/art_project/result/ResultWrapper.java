package com.art_project.result;

public class ResultWrapper<T extends Object> {

	private T result;

	private Result status;

	private String message;

	private String token;

	public void  exception(T result,String msg) {
		this.result = result;
		this.status = Result.EXCEPTION;
		this.message = msg;
	}
	
	public void  fail(T result,String msg) {
		this.result = result;
		this.status = Result.FAIL;
		this.message = msg;
	}

	public void succeedCreated(T result, String msg) {
		this.result = result;
		this.status = Result.SUCCESS;
		this.message = msg;
	}

	public void succeedUpdated(T result, String msg) {
		this.result = result;
		this.status = Result.SUCCESS;
		this.message = msg;
	}

	public void succeedDeleted(T result, String msg) {
		this.result = result;
		this.status = Result.SUCCESS;
		this.message = msg;
	}

	public T getResult() {
		return result;
	}

	public void setResult(T result) {
		this.result = result;
	}

	public Result getStatus() {
		return status;
	}

	public void setStatus(Result status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

}
