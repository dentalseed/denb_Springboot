<?php
include_once('../../config.php');
include_once(IM_ORDER_PATH . '/lib.php');
include_once(IM_ORDER_PATH . '/lib.pay.php');

extract($_REQUEST);

$dentist_idx = get_cookie("cook_dentist_idx") ?: 1;
if (!$dentist_idx) {
    alert("잘못된 접근입니다.(5)", "../index.php");
}

$cf = get_dentist_view($dentist_idx);
if (!$cf['idx']) {
    alert("찾을수 없는 병원입니다.");
}
extract($cf);

require_once('libs/INIStdPayUtil.php');
$SignatureUtil = new INIStdPayUtil();

$mid 			= "welcometst";  								// 상점아이디			
$signKey 		= "QjZXWDZDRmxYUXJPYnMvelEvSjJ5QT09"; 			// 웹 결제 signkey

$mKey 	= $SignatureUtil->makeHash($signKey, "sha256");

$timestamp 		= $SignatureUtil->getTimestamp();   			// util에 의해서 자동생성
$orderNumber 	= $_REQUEST["wp_itemcd"]; 						// 가맹점 주문번호(가맹점에서 직접 설정)
$price 			= $_REQUEST["wp_reqamt"];        	    		// 상품가격(특수기호 제외, 가맹점에서 직접 설정)

$good_name 	    = $_REQUEST["wp_itemnm"];
$buyer_email 	= $_REQUEST["buyeremail"];
$buyer_tel 	    = $_REQUEST["buyertel"];
$buyer_name 	= $_REQUEST["buyername"];

$cpid 	        = $_REQUEST["wp_cpid"];
$wmode 	        = $_REQUEST["wp_mode"];
$cparam = '{"wmode":"'.$wmode.'","cpid":"'.$cpid.'"}';

///////////////
$price = 1000;
$orderNumber = "mbtest001";
///////////////


$params = array(
    "mkey" => $mKey,
    "P_AMT" => $price,
    "P_OID" => $orderNumber,
    "P_TIMESTAMP" => $timestamp
);

$tmp = "mkey=".$mKey."&P_AMT=".$price."&P_OID=".$orderNumber."&P_TIMESTAMP=".$timestamp;
$tmp_sign = $SignatureUtil->makeHash($tmp, "sha256");
$sign   = $SignatureUtil->makeSignature($params);

$qry   = " insert into pay_tran_log ( ";
$qry  .= "   tid, tr_stat, result_code, result_msg, moid, pay_method, tot_price, good_name, buyer_email, buyer_tel, buyer_name, wmode, cpid ";
$qry  .= " ) values ( ";
$qry  .= " '{$timestamp}', 'R', '', '전문송신', '{$orderNumber}', 'Card', '{$price}', '{$good_name}', '{$buyer_email}', '{$buyer_tel}', '{$buyer_name}', '{$wmode}', '{$cpid}' ";
$qry  .= " ) ";

$result = sql_query($qry, false);

$qry   = " insert into pay_tran_h ( ";
$qry  .= "   tid, tr_stat, result_code, result_msg, moid, pay_method, tot_price, good_name, buyer_email, buyer_tel, buyer_name, wmode, cpid ";
$qry  .= " ) values ( ";
$qry  .= " '{$cpid}', 'R', '', '전문송신', '{$orderNumber}', 'Card', '{$price}', '{$good_name}', '{$buyer_email}', '{$buyer_tel}', '{$buyer_name}', '{$wmode}', '{$cpid}' ";
$qry  .= " ) ";

$result = sql_query($qry, false);

?>
<!DOCTYPE html>
<html lang="ko">

    <head>
        <meta charset="euckr">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport"
            content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <title>결제</title>
        <link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/bootstrap.min.css">
        <script type="text/javascript">
            window.onload = function() {
                //on_wpay();
            };
            function on_wpay() {
                document.getElementById('frm_wpay').submit();
            }
            </script>
    </head>

    <body class="wrap">
<p>tmp: <?php echo $tmp ?></p>
<p>tmp_sign: <?php echo $tmp_sign ?></p>
<p>params: <?php echo var_dump($params) ?></p>
        <!-- 본문 -->
        <main class="col-8 cont" id="bill-01">

            <!-- 카드CONTENTS -->
            <section class="menu_cont mb-5">
                <form id="frm_wpay" name="frm_wpay" method="post" accept-charset="euc-kr" action="https://tmobile.paywelcome.co.kr/smart/wcard/">

                <input type="text" name="P_MID" value="<?php echo $mid ?>" />
                <input type="text" name="P_OID" value="<?php echo $orderNumber ?>" />
                <input type="text" name="P_AMT" value="<?php echo $price ?>" />
                <input type="text" name="P_UNAME" value="topup" />
                <input type="text" name="P_GOODS" value="<?php echo $_REQUEST["wp_itemnm"] ?> (테스트금액결제)" />
                <input type="text" name="P_NEXT_URL" value="https://dev.denb.co.kr/plugin/wpay/wpay_web_return.php" />
                <input type="text" name="P_TIMESTAMP" value="<?php echo $timestamp ?>" />
                <input type="text" name="P_SIGNATURE" value="<?php echo $tmp_sign ?>" />
                <input type="text" name="P_CAHRSET" value="euckr" />
                <input type="text" name="P_RESERVED" value="twotrs_isp=Y&twotrs_isp_noti=N&apprun_check=Y" />
                <input type="text" name="P_EMAIL" value="test@test.com" />

                </form>
                
                <div class="card">
                    <button onclick="on_wpay();" class="btn_solid_pri col-6 mx-auto btn_lg" style="margin-top:50px">결제하기</button>

                    <p style="color: #ccc; display: flex; justify-content: space-around; margin-top: 10vh;">
                      이창이 저절로 닫기지 않는 경우<br />
                      (결제가 실패하는 경우 등)<br />
                      닫기 버튼으로 이 창을 닫으십시오.
                    </p>
                    <p style="color: #ccc; display: flex; justify-content: space-around;">
                        <?= $_REQUEST["wp_mode"] ?>
                        <?
                            if($result) 
                                echo "PG 바인딩 성공";
                        ?>
                    </p>

                    <button onclick="self.close();" class="btn_solid_pri col-6 mx-auto btn_lg" style="margin-top:50px">닫기</button>

                </div>
            </section>
			
        </main>
		
    </body>
</html>
