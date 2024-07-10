package com.denb.web.mypage.entity;

import java.io.Serial;
import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Mypage  implements Serializable {
    private static final long serialVersionUID = 6494678977089006639L;
	private int idx;
	private String userId;
}
