<?php
	include 'Common.php';
	
	//개별,대량 메시지 발송
	try {
		$apiUrl = "/send/sms/";
		$msgParam = array(
			"MessageType"=>1,
			"MessageSubType"=> 1,					//(Int) 1->일반텍스트(SMS)
			"CallbackNumber"=> "01012345678",		//(String) 회신번호
			//"SenNumber" => "01000000000",			//(String) 발신과근번호 (Option)
			//"ReserveType" => "1"					//(String) 예약타입 1->즉시발송(defualt) , 2->예약발송 (Option)
			//"ReserveTime" => "20191210000000"		//(String) 예약시간 YYYYMMDDHHMMSS (Option)
			//"ReserveDTime" => "20191210000000"	//(String) 만료시간 YYYYMMDDHHMMSS 예약 만료시간 초과한 경우 발송이 안됩니다.(Option)
			//"CustomMessageID"=> "DFKJLAFKHD_011",	//(String) SP Client 에서 지정한 메시지 ID (Option)	
			//"CDRID" => "TEST",					//(String) CDR_ID에 입력된 특정 아이디로 과금하는 기능 (Option)
			//"CDRTime" => "20191231000000",		//(String) 과금 정산 시간 YYYYMMDDHHMMSS 지정하지 않는경우 발송시간 기준으로 과금 (Option)	
			"Bundle"=>array(
				array(
					"Seq"=>1,						//(Int) 수신리스트 Sequence
					"Subject"=>"제목",				//(String) 메시지 제목 (Option)
					"Content"=>"메시지 내용",			//(String) 메시지 내용
					"Number"=>"01012345678"			//(String) 수신번호
				),
				array(
					"Seq"=>2,
					"Subject"=>"제목1",
					"Content"=>"메시지 내용2",
					"Number"=>"01012345679"
				)
			)
		);

		$result = $Message->executeMessage($apiUrl,$msgParam);

		print_r($result);

	} catch(Exception $e) {
		echo $e->getMessage();
		echo $e->getCode();
	}
	
?>