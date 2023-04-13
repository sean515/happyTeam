package com.meal.happy.dao;

import java.util.List;

import com.meal.happy.dto.CommDTO;
import com.meal.happy.dto.PagingVO;

public interface CommDAO {
	//글등록
	public int boardInsert(CommDTO dto);
	//총레코드 수
	public int totalRecord(PagingVO vo);
	//해당 페이지 선택
	public List<CommDTO> pageSelect(PagingVO vo);
	//글 선택(no)
	public CommDTO boardSelect(int no);
	//글 선택 수정
	public CommDTO boardEditSelect(int no);
	//글 수정(DB update)
	public int boardUpdate(CommDTO dto);
	//조회수 증가
	public void boardHitCount(int no);
	//글 삭제
	public int boardDelete(CommDTO dto);
	//여러 글 한번에 삭제
	public int boardMultiLineDelete(List<Integer> noList);
}
