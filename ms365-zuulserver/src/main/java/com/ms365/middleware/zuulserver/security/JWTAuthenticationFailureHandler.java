package com.ms365.middleware.zuulserver.security;

import org.springframework.http.HttpStatus;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.ms365.middleware.zuulserver.filters.RouteFilter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
//debug
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class JWTAuthenticationFailureHandler implements AuthenticationFailureHandler {

	private static Logger logger = LoggerFactory.getLogger(JWTAuthenticationFailureHandler.class);	//debug
	private final HttpStatus statusErrorResponse;

	
	
	public JWTAuthenticationFailureHandler(HttpStatus statusErrorResponse) {
		logger.info(" debug  JWTAuthenticationFailureHandler > param statusErrorResponse ", statusErrorResponse);//debug
		
		this.statusErrorResponse = statusErrorResponse;
		logger.info(" debug  statusErrorResponse >  ",this.statusErrorResponse);//debug
	}

	public JWTAuthenticationFailureHandler() {
		logger.info(" debug  JWTAuthenticationFailureHandler() >  ");//debug
		this.statusErrorResponse = HttpStatus.UNAUTHORIZED;
	}

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException e) throws IOException, ServletException {
		logger.info(" debug  onAuthenticationFailure() >  ","request: "+request +"response:"+response);//debug
		logger.info(" debug statusErrorResponse.value() >  ",statusErrorResponse.value());//debug
		response.setStatus(statusErrorResponse.value());
		response.setContentType("application/json");
		response.getWriter().append(jsonResponse());
	}

	private String jsonResponse() {
		long date = new Date().getTime();

		return "{\"timestamp\": " + date + ", "
				+ "\"status\": " + statusErrorResponse.value() + ", "
				+ "\"error\": \"Unauthorized\", "
				+ "\"message\": \"Authentication failed: bad credentials\", "
				+ "\"path\": \"/login\"}";
	}
}
