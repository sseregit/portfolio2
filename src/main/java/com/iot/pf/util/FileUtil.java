package com.iot.pf.util;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.iot.pf.dto.Attachment;

@Component
public class FileUtil {
	
	@Value("${file.upload.directory}")
	private String fileUploadDirectory;
	
	@Value("${file.upload.tmp.directory}")
	private String tmpDirectory;
	
	private static Logger Log = Logger.getLogger(FileUtil.class);
	
	public byte[] download(Attachment ac,HttpServletResponse rep) {
		
		File file = new File(fileUploadDirectory + "/" +ac.getFakeName());

		String endcodingName;
		byte[] b = null;
		try {
			endcodingName = java.net.URLEncoder.encode(ac.getFileName(),"UTF-8");
			rep.setContentType(ac.getContentType());
			rep.setHeader("Content-Disposition", "attachment; filename=\""+endcodingName + "\"");
			rep.setHeader("Pragma", "no-cache");
			rep.setHeader("cache-Control", "no-cache");
			rep.setContentLength((int) ac.getFileSize());
			 b = FileUtils.readFileToByteArray(file);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return b;
		
	}

	/**
	 * 임시 폴더에 있는 업로드 된 파일을 업로드 폴더로 복사
	 * @param att
	 * @throws IOException
	 */
    public void copyTmpFileToUploadFolder(Attachment att)throws IOException{
    	
    	// 임시 파일 가져오기
    	File source = new File(tmpDirectory,att.getFakeName());
    	
    	// 업로드 폴더 지정
    	File dest = new File(fileUploadDirectory);
    	//없으면 생성
    	if(!dest.exists())dest.mkdirs();
    	//업로드 폴더에 파일 지정
    	dest = new File(dest,att.getFakeName());
    	//임시 폴더에 있는 업로드 파일을 업로드 폴더로 복사
    	FileCopyUtils.copy(FileUtils.readFileToByteArray(source), dest);;
    }
    
    /**
     * 비동기 파일 업로드 임시 폴더에 저장!
     * @param f
     * @param docType
     * @return
     */
    public Attachment copyToTmpFolder(MultipartFile f,String docType) {
    	Attachment att = null;
    	
    	if(!f.isEmpty()) {
    		att = new Attachment();
    		att.setAttachDocType(docType);
    		att.setFileName(f.getOriginalFilename());
    		att.setFileSize(f.getSize());
    		String fakeName = UUID.randomUUID().toString();
    		att.setFakeName(fakeName);
    		att.setContentType(f.getContentType());
    		//폴더에 복사
    		copyToFolder(f, fakeName, true);
    	    
    	}
    	return att;
    }
    
    public void copyToFolder(MultipartFile files,String fakename, boolean isTmp) {
    	// 저장할 폴더 생성
    	File target = new File( isTmp ? tmpDirectory : fileUploadDirectory);
    	if(!target.exists())target.mkdirs();
    	
    	target = new File(target,fakename); // target폴더에 uuid를 이름으로 가진 새로운 파일 생성
    	
    	// 물리저장소에 파일 쓰기
    	
    	try {
			FileCopyUtils.copy(files.getBytes(), target);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    }
    
    public void delfile(String fakeName) {
    	
    	File del = new File(tmpDirectory,fakeName);
    	
    	del.delete();
    	
    	File del1 = new File(fileUploadDirectory,fakeName);
    	
    	del1.delete();
    	
    }
}
