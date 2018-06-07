package com.iot.pf.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.iot.pf.dto.User;

public interface UserDAO {
    
	/**
	 * 회원가입 입력받기
	 * @param user
	 * @return
	 */
	public int insert(User user);
	/**
	 * 아이디중복확인
	 * @param userId
	 * @return
	 */
	public int chkId(String userName);
	
	public int checkId(String userName,String password);
	
	public String password(String password);
	
	public User getUser(String userName);
	
	public ArrayList<User> list(HashMap<String,Object> params);
	
	public int lastp(int seq);
	
}
