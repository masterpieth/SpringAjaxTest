package com.sesoc.ajaxtest.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.ajaxtest.vo.AjaxBoard;

@Repository
public class BoardDAO {

	@Autowired
	SqlSession sqlSession;

	public void insertBoard(AjaxBoard ajaxBoard) {
		try {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			mapper.insertBoard(ajaxBoard);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<AjaxBoard> selectBoard() {
		ArrayList<AjaxBoard> list = null;
		try {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			list = mapper.selectBoard();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void deleteBoard(int board_no) {
		try {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			mapper.deleteBoard(board_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
