package com.lec.service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface Service {
	public void execute(HttpServletRequest request, HttpServletResponse response);
}
