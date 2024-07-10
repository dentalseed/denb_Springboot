<?php

	class INIStdPayUtil	{
		function getTimestamp()	{
			date_default_timezone_set('Asia/Seoul');
			$date = new DateTime();
			
			$milliseconds = round(microtime(true) * 1000);	
			$tempValue1 = round($milliseconds/1000);		//max integer 자릿수가 9이므로 뒤 3자리를 뺀다
			$tempValue2 = round((float)microtime(false) * 1000);	//뒤 3자리를 저장
			switch (strlen($tempValue2)) {
				case '3':
					break;
				case '2':
					$tempValue2 = "0".$tempValue2;
					break;
				case '1':
					$tempValue2 = "00".$tempValue2;
					break;
				default:
					$tempValue2 = "000";
					break;
			}
			
			return "".$tempValue1.$tempValue2;
		}
	
		/*
		 //*** 위변조 방지체크를 signature 생성 ***
		 */	
		function makeSignature($signParam) {
var_dump($signParam);
			ksort($signParam);
var_dump($signParam);

			$string = "";
			foreach ($signParam as $key => $value) {
				$string .= "&$key=$value";
			}		
			$string = substr($string, 1); // remove leading "&"

var_dump($string);
            
			$sign = $this->makeHash($string, "sha256");
			//$this->hash256($string);
					
			return $sign;
		}
		
		function makeHash($data, $alg) {
			// $s = hash_hmac('sha256', $data, 'secret', true);
			// return base64_encode($s);
			
			$ret = openssl_digest($data, $alg);
			return $ret;
		}
		
		//결제보안 추가 인증.
		function makeSignatureAuth($parameters) {

			if ($parameters == null || sizeof($parameters) == 0) {
				throw new Exception("<p>Parameters can not be empty.</P>");
			}

			$stringToSign = "";															//반환용 text
	        $mid          = $parameters["mid"];                                                //mid
			$tstamp       = $parameters["tstamp"];												//auth timestamp
			$MOID         = $parameters["MOID"];												//OID
			$TotPrice     = $parameters["TotPrice"];											//total price
			$tstampKey    = substr($parameters["tstamp"], strlen($parameters["tstamp"]) - 1);	// timestamp 마지막 자리 1자리 숫자
			
			switch (intval($tstampKey)){
			case 1 :
				$stringToSign = "MOID=" . $MOID . "&mid=" . $mid . "&tstamp=" . $tstamp ;
				break;
			case 2 :
				$stringToSign = "MOID=" . $MOID . "&tstamp=" . $tstamp . "&mid=" . $mid ;
				break;
			case 3 :
				$stringToSign = "mid=" . $mid . "&MOID=" . $MOID . "&tstamp=" . $tstamp ;
				break;
			case 4 :
				$stringToSign = "mid=" . $mid . "&tstamp=" . $tstamp . "&MOID=" . $MOID ;
				break;
			case 5 :
				$stringToSign = "tstamp=" . $tstamp . "&mid=" . $mid . "&MOID=" . $MOID ;
				break;
			case 6 :
				$stringToSign = "tstamp=" . $tstamp . "&MOID=" . $MOID . "&mid=" . $mid ;
				break;
			case 7 :
				$stringToSign = "TotPrice=" . $TotPrice . "&mid=" . $mid . "&tstamp=" . $tstamp ;
				break;
			case 8 :
				$stringToSign = "TotPrice=" . $TotPrice . "&tstamp=" . $tstamp . "&mid=" . $mid ;
				break;
			case 9 :
				$stringToSign = "TotPrice=" . $TotPrice . "&MOID=" . $MOID . "&tstamp=" . $tstamp ;
				break;
			case 0 :
				$stringToSign = "TotPrice=" . $TotPrice . "&tstamp=" . $tstamp . "&MOID=" . $MOID ;
				break;
			}

	        $signature = hash("sha256", $stringToSign);            				// sha256 처리하여 hash 암호화
	        //$signature = $this->makeHash($stringToSign, "sha256");            // sha256 처리하여 hash 암호화

			return $signature;
		}
		
	}


?>