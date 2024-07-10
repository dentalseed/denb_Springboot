package com.denb.web.mypage.dao;
import org.apache.ibatis.annotations.Mapper;

import com.denb.web.mypage.dto.MypageDto;
import com.denb.web.mypage.dto.MypageTokenDto;


@Mapper
public interface MypageDao {
	//TEST 
//	MypageDto  selectMemberById(int idx);

	//토큰을 통해 사용자 조회 
	MypageTokenDto selectUserByToken(String token);
	
}
