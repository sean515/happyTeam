package com.meal.happy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.meal.happy.dao.SupDAO;
import com.meal.happy.dto.PagingVO;
import com.meal.happy.dto.SupDTO;

@Service
public class SupServiceImpl implements SupService {
	@Inject
	SupDAO dao;
	
	@Override
	public int supTotalRecord() {
		return dao.supTotalRecord();
	}

	
	@Override
	public List<SupDTO> supAllSelect() {
		return dao.supAllSelect();
	}

	@Override
	public int supInsert(SupDTO dto) {
		return dao.supInsert(dto);
	}

	@Override
	public int hitCount(int no) {
		return dao.hitCount(no);
	}

	@Override
	public SupDTO supSelect(int no) {
		return dao.supSelect(no);
	}

	@Override
	public SupDTO replyDataSelect(int no) {
		return dao.replyDataSelect(no);
	}

	@Override
	public int stepUp(SupDTO orgDataDTO) {
		return dao.stepUp(orgDataDTO);
	}

	@Override
	public int replyWrite(SupDTO dto) {
		return dao.replyWrite(dto);
	}

	@Override
	public SupDTO getsupSelect(int no) {
		return dao.getsupSelect(no);
	}

	@Override
	public int supUpdate(SupDTO dto) {
		return dao.supUpdate(dto);
	}

	@Override
	public int getLevel(int no) {
		return dao.getLevel(no);
	}

	@Override
	public int supDelete(int no) {
		return dao.supDelete(no);
	}

	@Override
	public int supDeleteUpdate(int no) {
		return dao.supDeleteUpdate(no);
	}
	

}
