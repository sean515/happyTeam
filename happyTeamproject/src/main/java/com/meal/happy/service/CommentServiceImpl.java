package com.meal.happy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.meal.happy.dao.CommentDAO;
import com.meal.happy.dto.CommentDTO;





@Service
public class CommentServiceImpl implements CommentService {
	@Inject
	CommentDAO dao;

	@Override
	public int commentInsert(CommentDTO dto) {
		return dao.commentInsert(dto);
	}

	@Override
	public List<CommentDTO> commentListSelect(int no) {
		return dao.commentListSelect(no);
	}

	@Override
	public int commentUpdate(CommentDTO dto) {
		return dao.commentUpdate(dto);
	}

	@Override
	public int commentDelete(int c_no, String userid) {
		return dao.commentDelete(c_no, userid);
	}


}
