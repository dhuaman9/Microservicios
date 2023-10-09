package com.ms365.middleware.usuarios.config;

import org.springframework.context.annotation.Bean;


import com.netflix.loadbalancer.IPing;
import com.netflix.loadbalancer.IRule;
import com.netflix.loadbalancer.NoOpPing;
import com.netflix.loadbalancer.WeightedResponseTimeRule;

//debug
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class RibbonConfig {
	
	private static Logger logger = LoggerFactory.getLogger(RibbonConfig.class);
   @Bean
   public IPing ribbonPing() {
	   logger.info(" debug IPing > metodo ribbonPing :"+ new NoOpPing() ); //debug
     return new NoOpPing();
   }

   @Bean
   public IRule ribbonRule() {
	   logger.info(" debug IRule > metodo ribbonRule :"+ new WeightedResponseTimeRule() ); //debug
     return new WeightedResponseTimeRule();
   }
}