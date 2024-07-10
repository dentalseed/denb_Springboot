<?php
	include 'Common.php';
	
	//개별,동보 메시지 발송
	try {
		
		$apiUrl = "/inquiry/report/";
		$msgParam = array(
			"JobIDs"=>array(111000000000000),	//(Int) 요청보낼 JobID
			"SendDay"=>"20200101"				//(String) 발송날짜 YYYYMMDD 
		);
		
		$result = $Message->executeMessage($apiUrl, $msgParam);
		print_r($result);

	} catch(Exception $e) {
		echo $e->getMessage();
		echo $e->getCode();
	}
	
?>