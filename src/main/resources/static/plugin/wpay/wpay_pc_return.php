<?php
include_once('./_common_r.php');

require_once('libs/INIStdPayUtil.php');
require_once('libs/HttpClient.php');

$util = new INIStdPayUtil();
$remap = null;

try {

    //#############################
    // 인증결과 파라미터 수신
    //#############################

    if (strcmp("0000", $_REQUEST["resultCode"]) == 0) {

        //############################################
        // 1.전문 필드 값 설정(***가맹점 개발수정***)
        //############################################

        $mid        = $_REQUEST["mid"];
        $timestamp  = $util->getTimestamp();
        $charset    = "UTF-8";
        $format     = "JSON";
        $authToken  = $_REQUEST["authToken"]; 
        $authUrl    = $_REQUEST["authUrl"];
        $netCancel  = $_REQUEST["netCancelUrl"];        
        $merchantData = $_REQUEST["merchantData"];

        //#####################
        // 2.signature 생성
        //#####################
        $signParam["authToken"] = $authToken;   // 필수
        $signParam["timestamp"] = $timestamp;   // 필수
        // signature 데이터 생성 (모듈에서 자동으로 signParam을 알파벳 순으로 정렬후 NVP 방식으로 나열해 hash)
        $signature = $util->makeSignature($signParam);


        //#####################
        // 3.API 요청 전문 생성
        //#####################
        $authMap["mid"]        = $mid;       // 필수
        $authMap["authToken"]  = $authToken; // 필수
        $authMap["signature"]  = $signature; // 필수
        $authMap["timestamp"]  = $timestamp; // 필수
        $authMap["charset"]    = $charset;   // default=UTF-8
        $authMap["format"]     = $format;    // default=XML

        try {

            $httpUtil = new HttpClient();

            //#####################
            // 4.API 통신 시작
            //#####################

            $authResultString = "";
            if ($httpUtil->processHTTP($authUrl, $authMap)) {
                $authResultString = $httpUtil->body;

            } else {
                echo "Http Connect Error\n";
                echo $httpUtil->errormsg;

                throw new Exception("Http Connect Error");
            }

            //############################################################
            //5.API 통신결과 처리(***가맹점 개발수정***)
            //############################################################
            
            $resultMap = json_decode($authResultString, true);
            $remap = json_decode($authResultString);
            $result_json = json_decode(rawurldecode($remap->Noti));

            //extract($resultMap, EXTR_PREFIX_ALL, "re");

            // 결제 성공시 저장
            $qry   = " insert into pay_tran_log ( ";
            $qry  .= "   tid, tr_stat, result_code, result_msg, event_code, tot_price, moid, pay_method, appl_num, appl_date, appl_time, buyer_email, buyer_tel, buyer_name, card_num, currency, wmode, cpid";
            $qry  .= " ) values ( ";
            $qry  .= " '{$remap->tid}', 'S', '{$remap->resultCode}', '{$remap->resultMsg}', '{$remap->EventCode}', '{$remap->TotPrice}', '{$remap->MOID}', '{$remap->payMethod}', '{$remap->applNum}', '{$remap->applDate}', '{$remap->applTime}', '{$remap->buyerEmail}', '{$remap->buyerTel}', '{$remap->buyerName}', '{$remap->CARD_Num}', '{$remap->currency}', '{$result_json->wmode}', '{$result_json->cpid}' ";
            $qry  .= " ) ";
            $result = sql_query($qry, false);
?><xmp><? //echo var_dump($remap); ?></xmp><?
?><xmp><? //echo var_dump(rawurldecode($remap->Noti)); ?></xmp><?
?><xmp><? //echo var_dump($result_json); ?></xmp><?

            $qry   = " update pay_tran_h set ";
            $qry  .= "   tr_stat = 'C', ";
            $qry  .= "   appl_num = '{$remap->applNum}', ";
            $qry  .= "   appl_date = '{$remap->applDate}', ";
            $qry  .= "   appl_time = '{$remap->applTime}' ";
            $qry  .= " where tid = '{$result_json->cpid}' ";
            $result = sql_query($qry, false);
?><xmp><? //echo var_dump($remap); ?></xmp><?
?><xmp><? //echo var_dump(rawurldecode($remap->Noti)); ?></xmp><?
?><xmp><? //echo var_dump($result_json); ?></xmp><?
            switch($result_json->wmode)
            {
                case "order1":          // 대시보드-덴비CRM-금액충전하기
                    // 결제 성공시 주문 내용 업데이트
                    $qry  = " update dentist set ";
                    $qry .= " sms_amt = sms_amt + {$remap->TotPrice} ";
                    $qry .= " where idx = '{$result_json->cpid}' ";
                    $result = sql_query($qry, false);

                    break;
                case "order2":          // 대시보드-스토어-주문현황리스트
                    // 결제 성공시 주문 내용 업데이트
                    $qry  = " update product_order set ";
                    $qry .= " tid = '{$remap->tid}', ";
                    $qry .= " status = '카드결제완료' ";
                    $qry .= " where appr_idx = '{$result_json->cpid}' ";
                    $result = sql_query($qry, false);

                    $qry  = " update product_approval set ";
                    $qry .= " tid = '{$remap->tid}', ";
                    $qry .= " status = '카드결제완료' ";
                    $qry .= " where appr_idx = '{$result_json->cpid}' ";
                    $result = sql_query($qry, false);

                    break;
                case "order3":          // 대시보드-스토어-주문현황보기
                    // 결제 성공시 주문 내용 업데이트
                    $qry  = " update product_order set ";
                    $qry .= " tid = '{$remap->tid}', ";
                    $qry .= " status = '카드결제완료' ";
                    $qry .= " where appr_idx = '{$result_json->cpid}' ";
                    $result = sql_query($qry, false);

                    $qry  = " update product_approval set ";
                    $qry .= " tid = '{$remap->tid}', ";
                    $qry .= " status = '카드결제완료' ";
                    $qry .= " where appr_idx = '{$result_json->cpid}' ";
                    $result = sql_query($qry, false);

                    break;
                case "kiosk1":          // 대시보드-키오스크-접수하기
                    // 결제 성공시 주문 내용 업데이트
                    $qry  = " update patient set ";
                    $qry .= " status = '카드결제완료' ";
                    $qry .= " where patient_idx = '{$result_json->cpid}' ";
                    $result = sql_query($qry, false);

                    break;
                default:
                    break;
            }


        } catch (Exception $e) {
            //    $s = $e->getMessage() . ' (오류코드:' . $e->getCode() . ')';
            //####################################
            // 실패시 처리(***가맹점 개발수정***)
            //####################################
            //---- db 저장 실패시 등 예외처리----//
            $s = $e->getMessage() . ' (오류코드:' . $e->getCode() . ')';
            echo $s;

            //#####################
            // 망취소 API
            //#####################

            $netcancelResultString = ""; // 망취소 요청 API url(고정, 임의 세팅 금지)
            if ($httpUtil->processHTTP($netCancel, $authMap)) {
                $netcancelResultString = $httpUtil->body;
            } else {
                echo "Http Connect Error\n";
                echo $httpUtil->errormsg;

                throw new Exception("Http Connect Error");
            }

            echo "<br/>## 망취소 API 결과 ##<br/>";
            
            /*##XML output##*/
            //$netcancelResultString = str_replace("<", "&lt;", $$netcancelResultString);
            //$netcancelResultString = str_replace(">", "&gt;", $$netcancelResultString);

            // 취소 결과 확인
            echo "<p>". $netcancelResultString . "</p>";
        }
    } else {

    }
} catch (Exception $e) {
    $s = $e->getMessage() . ' (오류코드:' . $e->getCode() . ')';
    echo $s;
}
?>
<!DOCTYPE html>
<html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport"
            content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <title>결제</title>
        <link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/bootstrap.min.css">

        <script type="text/javascript">
            window.onload = function() {
<? if (strcmp("0000", $_REQUEST["resultCode"]) == 0) { ?>
                on_load();
<? } ?>
            };
            function on_load() {
                opener.top.document.location.reload();
                self.close();
            }
        </script>

    </head>

    <body class="wrap">

        <!-- 본문 -->
        <main class="col-8 cont" id="bill-01">
            <!-- 페이지타이틀 -->
            <section class="mb-5">
                <div class="tit">
                    <h2>일반결제</h2>
                </div>
            </section>
            <!-- //페이지타이틀 -->


            <!-- 카드CONTENTS -->
            <section class="menu_cont mb-5">
                <div class="card">
                    <form name="" id="result" method="post" class="mt-5">
                    <div class="row g-3 justify-content-between" style="--bs-gutter-x:0rem;">
 
                        <label class="col-10 col-sm-2 gap-2 input param" style="border:none;">resultCode</label>
                        <label class="col-10 col-sm-9 reinput">
                            <?php echo @(in_array($resultMap["resultCode"] , $resultMap) ? $resultMap["resultCode"] : $_REQUEST["resultCode"] ) ?>
                        </label>
						
						<label class="col-10 col-sm-2 input param" style="border:none;">resultMsg</label>
                        <label class="col-10 col-sm-9 reinput">
                            <?php echo @(in_array($resultMap["resultMsg"] , $resultMap) ? $resultMap["resultMsg"] : $_REQUEST["resultMsg"] ) ?>
                        </label>
						
						<label class="col-10 col-sm-2 input param" style="border:none;">tid</label>
                        <label class="col-10 col-sm-9 reinput">
                            <?php echo @(in_array($resultMap["tid"] , $resultMap) ? $resultMap["tid"] : "null" ) ?>
                        </label>
						
						<label class="col-10 col-sm-2 input param" style="border:none;">MOID</label>
                        <label class="col-10 col-sm-9 reinput">
                            <?php echo @(in_array($resultMap["MOID"] , $resultMap) ? $resultMap["MOID"] : "null" ) ?>
                        </label>
						
						<label class="col-10 col-sm-2 input param" style="border:none;">TotPrice</label>
                        <label class="col-10 col-sm-9 reinput">
                            <?php echo @(in_array($resultMap["TotPrice"] , $resultMap) ? $resultMap["TotPrice"] : "null" ) ?>
                        </label>
						
						<label class="col-10 col-sm-2 input param" style="border:none;">goodName</label>
                        <label class="col-10 col-sm-9 reinput">
                            <?php echo @(in_array($resultMap["goodName"] , $resultMap) ? $resultMap["goodName"] : "null" ) ?>
                        </label>
						
						<label class="col-10 col-sm-2 input param" style="border:none;">applDate</label>
                        <label class="col-10 col-sm-9 reinput">
                            <?php echo @(in_array($resultMap["applDate"] , $resultMap) ? $resultMap["applDate"] : "null" ) ?>
                        </label>
						
						<label class="col-10 col-sm-2 input param" style="border:none;">applTime</label>
                        <label class="col-10 col-sm-9 reinput">
                            <?php echo @(in_array($resultMap["applTime"] , $resultMap) ? $resultMap["applTime"] : "null" ) ?>
                        </label>
						
						<?php
						
						if (isset($resultMap["payMethod"]) && strcmp("VBank", $resultMap["payMethod"]) == 0) { //가상계좌
                            echo "
							<label class='col-10 col-sm-2 input param' style='border:none;'>VACT_Num</label>
                            <label class='col-10 col-sm-9 reinput'>".@(in_array($resultMap["VACT_Num"] , $resultMap) ? $resultMap["VACT_Num"] : "null" ).
                            "</label>
							
							<label class='col-10 col-sm-2 input param' style='border:none;'>VACT_BankCode</label>
                            <label class='col-10 col-sm-9 reinput'>".@(in_array($resultMap["VACT_BankCode"] , $resultMap) ? $resultMap["VACT_BankCode"] : "null" ).
                            "</label>
							
							<label class='col-10 col-sm-2 input param' style='border:none;'>VACT_Date</label>
                            <label class='col-10 col-sm-9 reinput'>".@(in_array($resultMap["VACT_Date"] , $resultMap) ? $resultMap["VACT_Date"] : "null" ).
                            "</label>"
							;
                        } else if (isset($resultMap["payMethod"]) && strcmp("VCard", $resultMap["payMethod"]) == 0) { //신용카드(ISP)
                             echo "
						    <label class='col-10 col-sm-2 input param' style='border:none;'>applNum</label>
                            <label class='col-10 col-sm-9 reinput'>".@(in_array($resultMap["applNum"] , $resultMap) ? $resultMap["applNum"] : "null" ).
                            "</label>"
							;
						}else if (isset($resultMap["payMethod"]) && strcmp("Card", $resultMap["payMethod"]) == 0) { //신용카드(안심클릭)
							echo "
						    <label class='col-10 col-sm-2 input param' style='border:none;'>applNum</label>
                            <label class='col-10 col-sm-9 reinput'>".@(in_array($resultMap["applNum"] , $resultMap) ? $resultMap["applNum"] : "null" ).
                            "</label>"
							;
						}
						
						?>
 
                    </div>
                </form>
				
				<button onclick="self.close();" class="btn_solid_pri col-6 mx-auto btn_lg" style="margin-top:50px">닫기</button>
					
                </div>
            </section>
			
        </main>

<xmp>
<? //var_dump($remap); ?>
</xmp>

    </body>
</html>