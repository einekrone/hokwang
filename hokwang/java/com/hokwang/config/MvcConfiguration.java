package com.hokwang.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.view.BeanNameViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.hokwang.comm.controller.AuthCheckInterceptor;

@Configuration
@ComponentScan(basePackages = "com.hokwang")
@EnableWebMvc
public class MvcConfiguration implements WebMvcConfigurer {

	@Bean
	public AuthCheckInterceptor authCheckInterceptor() {
		return new AuthCheckInterceptor();
	}

	@Bean
	public ViewResolver getViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		resolver.setOrder(3);
		return resolver;
	}

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authCheckInterceptor()).addPathPatterns("/emp*");
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/img/**").addResourceLocations("/imgimg/");
	}

	@Bean
	public LocaleChangeInterceptor localeChangeInterceptor() {
		LocaleChangeInterceptor interceptor = new LocaleChangeInterceptor();
		interceptor.setParamName("lang");
		return interceptor;
	}

	@Bean
	// bean 등록시의 id가 메소드 명이된다. 중요!
	public CommonsMultipartResolver multipartResolver() {
		// 객체 생성
		CommonsMultipartResolver multi = new CommonsMultipartResolver();

		// 옵션 추가 가능
		// setMaxUploadSizePerFile : 파일 하나당 업로드 가능한 최대 크기
		// setMaxUploadSize : 업로드하는 파일 총 양
		// setUploadTempDir : 이거 생략하면 각각 가지고 있는 임시폴더에 저장.
		multi.setMaxUploadSize(1024 * 10000); // 10MB
		return multi;
	}
	
	@Bean
	BeanNameViewResolver beanNameViewResolver() {
		BeanNameViewResolver bean = new BeanNameViewResolver();
		bean.setOrder(1);
		return bean;
	}
	
	@Bean
	BCryptPasswordEncoder bcryptPasswordEncoder() {
		BCryptPasswordEncoder en = new BCryptPasswordEncoder();
		return en;
	}
	
}
