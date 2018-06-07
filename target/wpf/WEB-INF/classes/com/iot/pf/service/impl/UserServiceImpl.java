package com.iot.pf.service.impl;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iot.pf.dao.UserDAO;
import com.iot.pf.dto.User;
import com.iot.pf.service.UserService;

@Service("UserService")
@Transactional(rollbackFor= {Exception.class})
public class UserServiceImpl implements UserService{

	@Autowired
	UserDAO ud;
	
	@Override
	
	public int insert(User user) {
		
		return ud.insert(user);
	}

	@Override
	public int chkId(String userName) {
		// TODO Auto-generated method stub
		return ud.chkId(userName);
	}

	@Override
	public int checkId(String userName, String password) {
		
	    String pass = ud.password(password);
	    
		return ud.checkId(userName, pass);
	}

	@Override
	public User getUser(String userName) {
		// TODO Auto-generated method stub
		return ud.getUser(userName);
	}

	@Override
	public ArrayList<User> list(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return ud.list(params);
	}

	@Override
	public int lastp(int seq) {
		// TODO Auto-generated method stub
		return ud.lastp(seq);
	}



}
