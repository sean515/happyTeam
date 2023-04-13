package com.meal.happy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.meal.happy.dao.CommDAO;
import com.meal.happy.dto.CommDTO;
import com.meal.happy.dto.PagingVO;

@Service
public class CommServiceImpl implements CommService {
	@Inject
	CommDAO dao;
	
	@Override
	public int boardInsert(CommDTO dto) {
		return dao.boardInsert(dto);
	}

	@Override
	public int totalRecord(PagingVO vo) {
		return dao.totalRecord(vo);
	}

	@Override
	public List<CommDTO> pageSelect(PagingVO vo) {
		return dao.pageSelect(vo);
	}

	@Override
	public CommDTO boardSelect(int no) {
		return dao.boardSelect(no);
	}

	@Override
	public CommDTO boardEditSelect(int no) {
		return dao.boardEditSelect(no);
	}

	@Override
	public int boardUpdate(CommDTO dto) {
		return dao.boardUpdate(dto);
	}

	@Override
	public void boardHitCount(int no) {
		dao.boardHitCount(no);
	}

	@Override
	public int boardDelete(CommDTO dto) {
		return dao.boardDelete(dto);
	}

	@Override
	public int boardMultiLineDelete(List<Integer> noList) {
		return dao.boardMultiLineDelete(noList);
	}

}
