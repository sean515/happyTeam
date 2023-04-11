package com.meal.happy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/*
interceptor처리 할 클래스
반드시 HandlerInterceptorAdaptor를 상속받아 만들다.
*/

public class LoginInterceptor extends HandlerInterceptorAdapter {
	//컨트롤러가 호출되기 전에 실행된다.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		//로그인 유무를 확인하고 로그인 된 경우 호출한 매핑주소로 이동하고.
		//로그인 안된 경우 로그인 폼으로 실행이 이동되도록 한다.
		HttpSession session = request.getSession();
		
		String logId = (String)session.getAttribute("logId");
		String logStatus = (String)session.getAttribute("logStatus");
		
		if(logStatus==null || !logStatus.equals("Y")) {
			response.sendRedirect(request.getContextPath()+"/loginForm");
			return false;
		}
		//반환형이 false이면 매핑을 변경하고
		//      true이면 매핑을 지속한다. 
		return true;
		
	}
	//컨트롤러가 실행후 View로 이동하기전에 실행된 메소드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable ModelAndView mav) throws Exception{
		
	}
	//컨트롤러가 실행후 호출되는 메소드
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable Exception ex) throws Exception{
		
	}
}