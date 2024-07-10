package com.denb.web.mypage.entity;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MypageToken  implements Serializable {
    private static final long serialVersionUID = 6494678977089006639L;
    private int idx; // 고유값
    private String token; // 토큰키
    private int dentistIdx; // 치과 의사 고유값
    private String jsonStr; // 공유테이블 JSON 문자열
    private LocalDateTime inDt; // 작성일
    private LocalDateTime endDt; // 유효 마감일
}
