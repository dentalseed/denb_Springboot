<?php
class Message {
	const URL_DEV = "https://devopenapi.xroshot.com/V1"; 
	const VERSION = "V1";
	public function __construct( $apiKey, $apiPW, $userKey, $isDev, $apiCenter )
    {
		if ($apiCenter == 'C') {
			$this->apiHost = "https://bzm-api.carrym.com:8443/v3/A/dentalseed1/messages";		//1센터
		} else if ($apiCenter == 2) {
			$this->apiHost = "https://openapi2.xroshot.com/V1";		//2센터
		} else if ($apiCenter == 3) {
			$this->apiHost = "https://openapis.xroshot.com/V1";		//3센터
		}

    }
	//메시지 요청시 필요한 헤더 값 세팅
	public function setHeader($msgParam, $isMulti = false) {
		$headers = array();
		if(!$isMulti) {
			$headers[] = "Content-Type: application/json; charset=utf-8";
			$headers[] = "Authorization: Bearer ".$this->apiKey;
		} 
		return $headers;
	}
	//Sms 메시지 요청
	public function executeMessage($apiUrl, $msgParam ){

		$headers = $this->setHeader($msgParam);
		$body = json_encode($msgParam , JSON_UNESCAPED_UNICODE );
		return $this->requestAPI($apiUrl, $headers, $body, null);

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
	}
}
