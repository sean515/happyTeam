package com.meal.happy.dao;

import java.util.List;

import com.meal.happy.dto.SupDTO;

public interface SupDAO {
	//총레코드수
		public int supTotalRecord();
		//레코드 전체선택
		public List<SupDTO> supAllSelect();
		//글등록
		public int supInsert(SupDTO dto);
		//조회수 증가
		public int hitCount(int no);
		//1개의 글선택
		public SupDTO supSelect(int no);
		//원글의 ref, lvl, step을 선택한다.
		public SupDTO replyDataSelect(int no);
		//원글의 ref가 같고 step 원글의 값보다 크면 step을 1증가
		public int stepUp(SupDTO orgDataDTO);
		//답글등록
		public int replyWrite(SupDTO dto);
		//계층형게시판 글수정(폼)
		public SupDTO getsupSelect(int no);
		//계층형게시판 글수정(DB)
		public int supUpdate(SupDTO dto);
		//lvl가져오기(삭제시 필요)
		public int getLevel(int no);
		//삭제하기 -delete
		public int supDelete(int no);
		//삭제하기 - update 답변글일때
		public int supDeleteUpdate(int no);
}
