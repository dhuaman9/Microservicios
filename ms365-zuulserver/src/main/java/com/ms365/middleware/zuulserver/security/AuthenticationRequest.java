package com.ms365.middleware.zuulserver.security;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
//debug

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Data
@EqualsAndHashCode
public class AuthenticationRequest implements Serializable {
  private static final long serialVersionUID = -2896730571205828745L;
  private static Logger logger = LoggerFactory.getLogger(AuthenticationRequest.class);  //debug

  private String user;
  private String password;

  public AuthenticationRequest() {
    super();
  }

  @Override
  public String toString() {
	  logger.info(" AuthenticationRequest > entrando al toString ");//debug
	  logger.info(" this.user >  ",this.user);//debug
	  logger.info(" this.user >  ",this.password);//debug
	  
    StringBuilder sb = new StringBuilder("{" + AuthenticationRequest.class.getSimpleName() + ":");
    sb.append("user").append("=").append(this.user).append(", ");
    sb.append("password").append("=").append(this.password);
    sb.append("}");

    
    
    return sb.toString();
  }
}
