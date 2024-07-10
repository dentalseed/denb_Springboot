package com.denb.web.mypage.dto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@AllArgsConstructor
@Builder
public class MypageTokenDto {
    private int idx; // 고유값
    private String token; // 토큰키
    private int dentistIdx; // 치과 의사 고유값
    private String jsonStr; // 공유테이블 JSON 문자열
}
