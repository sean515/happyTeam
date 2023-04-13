package com.meal.happy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.meal.happy.dto.PagingVO;
import com.meal.happy.dto.SupDTO;
import com.meal.happy.service.SupService;

@RestController
@RequestMapping("/sup")
public class SupController {

	@Autowired
	SupService service;
	
	//************트랜잭션 객체 DI(dependency injection)*******************
	@Autowired
	DataSourceTransactionManager transactionManager;
	
	@GetMapping("/supList")
	public ModelAndView supList(PagingVO vo) {
		ModelAndView mav = new ModelAndView();
		//총레코드
		int totalRecord = service.supTotalRecord();
		
		//레코드선택
		List<SupDTO> list =service.supAllSelect();
		
		mav.addObject("totalRecord", totalRecord);
		mav.addObject("list", list);
		
		
		mav.setViewName("sup/supList");
		return mav;
	}
	//원글쓰기 폼
	@GetMapping("/supWrite")
	public ModelAndView supWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sup/supWriteForm");
		return mav;
	}
	//원글쓰기 DB
	@PostMapping("/supWriteOk")
	public ResponseEntity<String> supWriteOk(SupDTO dto, HttpServletRequest request) {
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");
		//ip
		dto.setIp(request.getRemoteAddr());
		//로그인 id
		dto.setUserid((String)request.getSession().getAttribute("logId"));
		try {
			service.supInsert(dto);
		
			//글등록
			String body = "<script> location.href='/happy/sup/supList';</script>";
			entity = new ResponseEntity<String>(body,headers, HttpStatus.OK);
		}catch(Exception e) {
			//글등록실패
			String body = "<script>";
			body += "alert('글등록이 실패하였습니다.');";
			body += "history.go(-1);";
			body += "</script>";
			entity = new ResponseEntity<String>(body, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//글내용보기
	@GetMapping("/supView")
	public ModelAndView supView(int no) {
		ModelAndView mav = new ModelAndView();
		
		//조회수 증가
		service.hitCount(no);
		//해당글 선택
		SupDTO dto = service.supSelect(no);
		
		mav.addObject("dto",dto);
		mav.setViewName("sup/supView");
		return mav;
	}
	//답글쓰기 폼
	@GetMapping("/supAnswer/{no}")
	public ModelAndView supAnswer(@PathVariable("no") int no){
		ModelAndView mav = new ModelAndView();
		mav.addObject("mav",mav);
		mav.setViewName("sup/supAnswer");
		
		return mav;
	}
	
	//답글쓰기 DB
	@PostMapping("/supAnswerOk")
	public ResponseEntity<String> supAnswerOk(SupDTO dto,HttpServletRequest request) {
		DefaultTransactionDefinition definition = new DefaultTransactionDefinition();
		/*
		 PROPAGATION_REQUIRED: 트랜잭션이 있으면 그 상황에서 실행하고 없으면 새로운 트랜잭션을 만든다.
		 */
		definition.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(definition);
		
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");
		
		//dto: 원글번호, 제목, 글내용, ip, 글쓴이
		dto.setIp(request.getRemoteAddr());
		dto.setUserid((String)request.getSession().getAttribute("logId"));
		try {
			//원글(dto.no)의 ref, lvl, step을 선택한다.
			SupDTO orgDataDTO = service.replyDataSelect(dto.getNo());
			
			//원글과 같은 ref를 가진 글의 원글의 step보다 크면 1씩 증가한다.
			int cnt = service.stepUp(orgDataDTO);
			System.out.println("cnt->"+ cnt);
			
			//답글등록 -> dto : 제목, 글내용, 작성자, ip -> ref, lvl, step
			//			orgDataDTO : ref, lvl, step
			dto.setRef(orgDataDTO.getRef());
			dto.setLvl(orgDataDTO.getLvl());
			dto.setStep(orgDataDTO.getStep());
			
			int result = service.replyWrite(dto);
			
			//정상구현 -리스트
			String tag = "<script>location.href='/happy/sup/supList';</script>";
			entity = new ResponseEntity<String>(tag, headers, HttpStatus.OK);
		
			 transactionManager.commit(status);
		}catch(Exception e){
			e.printStackTrace();
			
			//예외발생
			String tag = "<script>";
			tag += "alert('답변이 등록되지 않았습니다.');";
			tag += "history.back();";
			tag += "</script>";
			
			entity = new ResponseEntity<String>(tag, headers, HttpStatus.BAD_REQUEST);
			transactionManager.rollback(status);
		}
		return entity;
	}
	//계층형게시판 글수정(폼)
	@GetMapping("/supEdit/{no}")
	public ModelAndView supEdit(@PathVariable("no") int no) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("dto",service.getsupSelect(no));
		mav.setViewName("sup/supEditForm");
		return mav;
	}
	//계층형게시판 글수정(DB)
	@PostMapping("/supEditOk")
	public ResponseEntity<String> supEditOk(SupDTO dto, HttpSession session){
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");
		
		dto.setUserid((String)session.getAttribute("logId"));
		
		try {
			int result = service.supUpdate(dto);
			
			if(result>0) {//수정
				//글내용보기로 이동
				String body = "<script>";
				body += "location.href='/happy/sup/supView?no="+dto.getNo()+"';";
				body += "</script>";
				
				entity = new ResponseEntity<String>(body, headers, HttpStatus.OK);
			}else {//수정안됨
				//강제 예외발생
				throw new Exception();
			}
		}catch(Exception e) {
			e.printStackTrace();
			//수정안됨
			String body = "<script>";
			body += "alert('글수정이 실패하였습니다.');";
			body += "history.back();";
			body += "</script>";
			
			entity = new ResponseEntity<String>(body, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//글이 삭제되면 목록, 삭제 실패하면 글내용보기 이동 
	@GetMapping("/supDelete")
	public ModelAndView supDelete(int no, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		//lvl을 가져와 원글인지 답변글인지 구별처리한다.
		int lvl = service.getLevel(no);
		if(lvl==0) {//delete 같은 ref를 가진 글을 삭제
			int result = service.supDelete(no);
			System.out.println("삭제된 레코드 수 : "+result);
			if(result>0) {//삭제됨
				mav.setViewName("redirect:supList");
			}else {//삭제안됨
				mav.addObject("no", no);
				mav.setViewName("redirect:supView");
			}
		}else {//update
			int result = service.supDeleteUpdate(no);
			System.out.println("삭제(수정)된 레코드 수 : "+result);
			if(result>0) {
				mav.setViewName("redirect:supList");
			}else {
				mav.addObject("no",no);
				mav.setViewName("redirect:supView");
			}
		}
		
		return mav;
	}
	@GetMapping("/commonSupList")
	public ModelAndView commonSupList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}
