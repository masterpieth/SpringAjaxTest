package com.sesoc.ajaxtest.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AjaxBoard {

	private int board_no;
	private String board_nm;
	private String board_context;
}
