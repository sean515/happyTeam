package com.meal.happy.service;

import java.util.List;

import com.meal.happy.dto.CommDTO;
import com.meal.happy.dto.PagingVO;



public interface CommService {
	public int boardInsert(CommDTO dto);

	public int totalRecord(PagingVO vo);

	public List<CommDTO> pageSelect(PagingVO vo);

	public CommDTO boardSelect(int no);

	public CommDTO boardEditSelect(int no);

	public int boardUpdate(CommDTO dto);

	public void boardHitCount(int no);

	public int boardDelete(CommDTO dto);

	public int boardMultiLineDelete(List<Integer> noList);
}
