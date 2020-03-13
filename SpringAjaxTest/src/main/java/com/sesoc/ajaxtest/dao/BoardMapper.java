package com.sesoc.ajaxtest.dao;

import java.util.ArrayList;

import com.sesoc.ajaxtest.vo.AjaxBoard;

public interface BoardMapper {

	public int insertBoard(AjaxBoard ajaxBoard);
	public ArrayList<AjaxBoard> selectBoard();
	public void deleteBoard(int board_no);
}
