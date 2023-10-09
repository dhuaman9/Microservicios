package com.ms365.middleware.zuulserver.filters;

import org.springframework.cloud.netflix.zuul.filters.support.FilterConstants;

import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;

//debug
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class RouteFilter extends ZuulFilter {
	
	
  private static Logger logger = LoggerFactory.getLogger(RouteFilter.class);	
  
  @Override
  public String filterType() {
	  logger.info(" debug RouteFilter >  filterType() :  ", FilterConstants.ROUTE_TYPE); //debug  
	  
    return FilterConstants.ROUTE_TYPE;
  }

  @Override
  public int filterOrder() {
	  logger.info(" debug RouteFilter >  filterOrder() : SIMPLE_HOST_ROUTING_FILTER_ORDER ", FilterConstants.SIMPLE_HOST_ROUTING_FILTER_ORDER - 1); //debug  
    return FilterConstants.SIMPLE_HOST_ROUTING_FILTER_ORDER - 1;
  }

  @Override
  public boolean shouldFilter() {
	  
	  logger.info(" debug shouldFilter() >  RequestContext.getCurrentContext().getRouteHost()  :  ", RequestContext.getCurrentContext().getRouteHost() ); //debug  
	  logger.info(" debug shouldFilter() >  RequestContext.getCurrentContext().sendZuulResponse() :  ", RequestContext.getCurrentContext().sendZuulResponse() ); //debug  
	  
    return RequestContext.getCurrentContext().getRouteHost() != null &&
           RequestContext.getCurrentContext().sendZuulResponse();
  }

  @Override
  public Object run() {
    return null;
  }
}