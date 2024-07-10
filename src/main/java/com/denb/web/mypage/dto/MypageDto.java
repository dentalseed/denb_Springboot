package com.denb.web.mypage.dto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@AllArgsConstructor
@Builder
public class MypageDto {
	private int idx;
	private String userId;
	
}
