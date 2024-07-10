<?php
	include 'Common.php';
	
	//예약메시지 조회, 취소
	try {
		$apiUrl = "/inquiry/reserve/";
		$msgParam = array(
			"Type"=>1,								//(Int) 0->취소, 1->조회
			"JobIDs"=>array(2599012840,2599012841)	//(Int) 요청보낼 JobID 
		);
		
		$result = $Message->executeMessage($apiUrl,$msgParam);

		print_r($result);

	} catch(Exception $e) {
		echo $e->getMessage();
		echo $e->getCode();
	}
	
?>