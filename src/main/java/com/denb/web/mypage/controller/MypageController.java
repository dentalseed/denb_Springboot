package com.denb.web.mypage.controller;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.denb.web.mypage.dto.MypageTokenDto;
import com.denb.web.mypage.service.MypageService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequiredArgsConstructor
public class MypageController {
	
	private final MypageService mypageService;

    @GetMapping("/mypage.do")
    public String home(Model model) {

    	String token = "8GJlBfGGPITf0_bXfWMWTgQ_c_c";
    	MypageTokenDto mypageTokenDto = mypageService.findToken(token);
    	
    	String jsonStr = mypageTokenDto.getJsonStr();
    	try {
    		 ObjectMapper objectMapper = new ObjectMapper();
    		 JsonNode jsonNode = objectMapper.readTree(jsonStr);
    		 String patientIdx = jsonNode.get("patient_idx").asText();
    		 System.out.println("접속환자의 patientIdx " + patientIdx );
    		 
    		 model.addAttribute("patientIdx",patientIdx);
    		 model.addAttribute("mypageTokenDto",mypageTokenDto);
    		 
    	}catch (Exception e) {
            e.printStackTrace();
            return "올바르지 않은 토큰 값입니다.(java): " + e.getMessage();
		}
    	 
        return "mypage/patient_mypage3";
    }
   
}