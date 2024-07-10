<?php
class Message {

	const URL_DEV = "https://devopenapi.xroshot.com/V1"; 
	const VERSION = "V1";

	public function __construct( $apiKey, $apiPW, $userKey, $isDev, $apiCenter )
    {
        $this->apiKey =		$apiKey;
        $this->apiPW =		$apiPW;
		$this->userKey =	$userKey;
		$this->isDev =		$isDev;

		if ($apiCenter == 1) {
			$this->apiHost = "https://openapi1.xroshot.com/V1";		//1센터
		} else if ($apiCenter == 2) {
			$this->apiHost = "https://openapi2.xroshot.com/V1";		//2센터
		} else if ($apiCenter == 3) {
			$this->apiHost = "https://openapis.xroshot.com/V1";		//3센터
		}

    }
	//메시지 요청시 필요한 헤더 값 세팅
	public function setHeader($msgParam, $isMulti = false) {

		$headers = array();
		$hashKey = $this->getHashKey();
		$hashData = json_encode($msgParam ,JSON_UNESCAPED_UNICODE ).$this->userKey;
		$hash = strtoupper(hash_hmac("sha256",$hashData,$hashKey));

		//기본 header 값 설정
		$headers[] = "API-KEY: ".$this->apiKey;
		$headers[] = "HASH: ".$hash;
		$headers[] = "SALT: ".$this->userKey;
		$headers[] = "TIMESTAMP: ".$this->getTimestamp();
		$headers[] = "SECRET-KEY: ".$this->apiPW;
		

		//Content-Type 값 설정
		if(!$isMulti) {
			$headers[] = "Content-Type: application/json; charset=utf-8";
		} 

		return $headers;
	}

	//HASH_KEY+_+TIMESTAMP 값으로  sha256 hasing 결과 값 
	public function getHash(){
		return hash("sha256", $this->apiPW);
	}
	
	public function getTimestamp(){
		return date("YmdHis");
	}

	public function getHashKey() {

		return $this->apiPW."_".$this->getTimestamp();
	}

	public function getBoundary() {
		$boundary = "--------------------------".substr(hash("md5" , $this->getHashKey()),0,25); 
		return $boundary;
	}

	//Sms 메시지 요청
	public function executeMessage($apiUrl, $msgParam ){

		/*
		한국인터넷진흥원(KISA)의 최초 발신자 식별코드 삽입 지침이 2024년 1월부터 시행됨에 따라
		2024년 1월 1일부터는 최초발송자 식별코드가 없으면 발송이 제한됩니다.
		*/
		$msgParam['KisaOrigCode'] = 301210079;
		$headers = $this->setHeader($msgParam);
		
		$body = json_encode($msgParam , JSON_UNESCAPED_UNICODE );

		return $this->requestAPI($apiUrl, $headers, $body, null);

	}

	//Mms 메시지 요청
	public function executeMultiMessage($apiUrl, $msgParam, $fileParam = null){

		/*
		한국인터넷진흥원(KISA)의 최초 발신자 식별코드 삽입 지침이 2024년 1월부터 시행됨에 따라
		2024년 1월 1일부터는 최초발송자 식별코드가 없으면 발송이 제한됩니다.
		*/
		$msgParam['KisaOrigCode'] = 301210079;

		$cr = "\r\n";
		$headers = $this->setHeader($msgParam,true);
		$boundary = $this->getBoundary();
		$headers[] = "Content-Type: multipart/form-data;"." boundary=".$boundary;
		$msgBody = "";
		$fileBody = "";
		$body = "";
		
		//메시지 바디
		$msgBody .= "--".$boundary . $cr;
		$msgBody .= "Content-Disposition: form-data; name=\"message\"" . $cr;
		$msgBody .= "Content-Type: application/json; charset=utf-8" . $cr . $cr;
		$msgBody .= json_encode($msgParam , JSON_UNESCAPED_UNICODE ) . $cr;

		//파일 바디
		if (!empty($fileParam) ) {
			foreach($fileParam as $val) {
				if(file_exists($val)){
					$fileMime = mime_content_type($val);
					$fileBody .= "--".$boundary . $cr;	
					$fileBody .= "Content-Disposition: form-data; name=\"file\"; filename=\"" . basename($val) . "\"" . $cr;
					$fileBody .= "Content-Type: ".$fileMime . $cr . $cr;
					$fileBody .= file_get_contents($val) . $cr;
				}
			}
		}

		$body = $msgBody . $fileBody;
		$body .= "--".$boundary . "--" ;

		return $this->requestAPI($apiUrl, $headers, $body );
	}

	//CURL 전송
	public function requestAPI($apiUrl,$headers, $body) {
		
		$ch = curl_init();

		curl_setopt($ch, CURLOPT_URL, (!$this->isDev) ? $this->apiHost.$apiUrl : self::URL_DEV.$apiUrl);
		curl_setopt($ch, CURLOPT_HEADER, 0);			//response 헤더 내용 표시 0,1
		curl_setopt($ch, CURLOPT_HTTPHEADER, $headers); 
		curl_setopt($ch, CURLOPT_POST, true);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $body);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
		curl_setopt($ch, CURLOPT_SSLVERSION,1); 
		
		return curl_exec($ch);
		curl_close($ch);
		//$result = curl_exec($ch);
		//$dbg_msg = var_dump($result);
		//file_put_contents("/data/debug01.txt", $dbg_msg, FILE_APPEND);
	}
}
?>