package com.denb.web.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.denb.web.mypage.dao.MypageDao;
import com.denb.web.mypage.dto.MypageDto;
import com.denb.web.mypage.dto.MypageTokenDto;

@Service
public class MypageService {
	
	 private final MypageDao mypageDao;
	 
	  @Autowired
	    public MypageService(MypageDao mypageDao) {
	        this.mypageDao = mypageDao;
	    }
	
//	public MypageDto findId(int id) {
//		MypageDto mypage = mypageDao.selectMemberById(id);
//		return mypage;
//	}
	//tokenDto 에 patient id , 등
	public MypageTokenDto findToken(String token) {
		MypageTokenDto tokenDto = mypageDao.selectUserByToken(token);
		return tokenDto;
	}
	
	
}