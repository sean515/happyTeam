package com.meal.happy.service;

import java.util.List;

import com.meal.happy.dto.SupDTO;

public interface SupService {
	public int supTotalRecord();
	public List<SupDTO> supAllSelect();
	public int supInsert(SupDTO dto);
	public int hitCount(int no);
	public SupDTO supSelect(int no);
	public SupDTO replyDataSelect(int no);
	public int stepUp(SupDTO orgDataDTO);
	public int replyWrite(SupDTO dto);
	public SupDTO getsupSelect(int no);
	public int supUpdate(SupDTO dto);
	public int getLevel(int no);
	public int supDelete(int no);
	public int supDeleteUpdate(int no);
}
