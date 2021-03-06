package com.iot.pf.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.iot.pf.dto.Attachment;
import com.iot.pf.dto.Board;

public interface BoardService {
	
	public ArrayList<Board> list(HashMap<String,Object> params);
	
	public int count();
	
	public void writeWithFileInfo(Board board,List<Attachment> info) throws IOException;
	
	public Board getboard(int boardNumber);
	
	public void updateWithFileInfo(Board board,List<Attachment> files);
	
	public int delete(int BoardNumber);
	



}
