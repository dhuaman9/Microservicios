package com.ms365.middleware.zuulserver.filters;

import org.springframework.cloud.netflix.zuul.filters.support.FilterConstants;

import com.netflix.zuul.ZuulFilter;

//debug
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
//
public class PostFilter extends ZuulFilter {
	
	private static Logger logger = LoggerFactory.getLogger(PostFilter.class);
  @Override
  public String filterType() {
	logger.info(" debug postfilter> FilterConstants.POST_TYPE) :  ", FilterConstants.POST_TYPE); //debug  
    return FilterConstants.POST_TYPE;
  }

  @Override
  public int filterOrder() {
	logger.info(" debug -metod filterOrder > FilterConstants.SEND_RESPONSE_FILTER_ORDER - 1) :  ", FilterConstants.SEND_RESPONSE_FILTER_ORDER - 1); //debug
    return FilterConstants.SEND_RESPONSE_FILTER_ORDER - 1;
  }

  @Override
  public boolean shouldFilter() {
    return true;
  }

  @Override
  public Object run() {
    return null;
  }
}
