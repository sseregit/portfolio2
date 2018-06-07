package com.iot.pf.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iot.pf.dao.AttachmentDAO;
import com.iot.pf.dto.Attachment;
import com.iot.pf.service.AttachmentService;

@Service("AttachService")
public class AttachmentServiceImpl implements AttachmentService{

	@Autowired
	AttachmentDAO ad;
	
	@Override
	public int insert(Attachment acm) {
		// TODO Auto-generated method stub
		return ad.insert(acm);
	}

	@Override
	public ArrayList<Attachment> getAttachment(String docType, int seq) {
		// TODO Auto-generated method stub
		return ad.getAttachment(docType, seq);
	}

	@Override
	public Attachment getAttach(int seq) {
		// TODO Auto-generated method stub
		return ad.getAttach(seq);
	}

	@Override
	public int delete(int seq) {
		// TODO Auto-generated method stub
		return ad.delete(seq);
	}

}
