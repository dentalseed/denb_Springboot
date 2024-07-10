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

$mid             = "welcometst";                                  // 상점아이디			
$signKey         = "QjZXWDZDRmxYUXJPYnMvelEvSjJ5QT09";             // 웹 결제 signkey

$mKey     = $SignatureUtil->makeHash($signKey, "sha256");

$timestamp         = $SignatureUtil->getTimestamp();               // util에 의해서 자동생성
$orderNumber     = $_REQUEST["wp_itemcd"];                         // 가맹점 주문번호(가맹점에서 직접 설정)
$price             = $_REQUEST["wp_reqamt"];                        // 상품가격(특수기호 제외, 가맹점에서 직접 설정)

$good_name         = $_REQUEST["wp_itemnm"];
$buyer_email     = $_REQUEST["buyeremail"];
$buyer_tel         = $_REQUEST["buyertel"];
$buyer_name     = $_REQUEST["buyername"];

$cpid             = $_REQUEST["wp_cpid"];
$wmode             = $_REQUEST["wp_mode"];
$cparam = '{"wmode":"' . $wmode . '","cpid":"' . $cpid . '"}';

$params = array(
    "mKey" => $mKey,
    "oid" => $orderNumber,
    "price" => $price,
    "timestamp" => $timestamp
);

$sign   = $SignatureUtil->makeSignature($params);

$qry   = " insert into pay_tran_log ( ";
$qry  .= "   tid, tr_stat, result_code, result_msg, moid, pay_method, tot_price, good_name, buyer_email, buyer_tel, buyer_name, wmode, cpid ";
$qry  .= " ) values ( ";
$qry  .= " '{$timestamp}', 'R', '', '전문송신', '{$orderNumber}', 'Card', '{$price}', '{$good_name}', '{$buyer_email}', '{$buyer_tel}', '{$buyer_name}', '{$wmode}', '{$cpid}' ";
$qry  .= " ) ";

$result = sql_query($qry, false);

?>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>결제</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <script type="text/javascript">
        window.onload = function() {
            on_wpay();
        };

        function on_wpay() {

        }
    </script>
</head>

<body class="wrap">

    <!-- 본문 -->
    <main class="col-8 cont" id="bill-01">

        <!-- 카드CONTENTS -->
        <section class="menu_cont mb-5">
            <div class="card">

                <form name="" id="SendPayForm_id" method="post" class="mt-5 d-none">
                    <input type="hidden" name="merchantData" value="<? echo rawurlencode($cparam) ?>" />
                    <div class="row g-3 justify-content-between" style="--bs-gutter-x:0rem;">

                        <label class="col-10 col-sm-2 input param" style="border:none;">paytype</label>
                        <label class="col-10 col-sm-9 input">
                            <input type="text" name="gopaymethod" value="Card">
                        </label>

                        <label class="col-10 col-sm-2 input param" style="border:none;">mid</label>
                        <label class="col-10 col-sm-9 input">
                            <input type="text" name="mid" value="welcometst">
                        </label>

                        <label class="col-10 col-sm-2 input param" style="border:none;">oid</label>
                        <label class="col-10 col-sm-9 input">
                            <input type="text" name="oid" value="<?= $orderNumber ?>">
                        </label>

                        <label class="col-10 col-sm-2 input param" style="border:none;">price</label>
                        <label class="col-10 col-sm-9 input">
                            <input type="text" name="price" value="<?= $price ?>">
                        </label>

                        <label class="col-10 col-sm-2 input param" style="border:none;">timestamp</label>
                        <label class="col-10 col-sm-9 input">
                            <input type="text" name="timestamp" value="<?= $timestamp ?>">
                        </label>


                        <input type="hidden" name="signature" value="<?php echo $sign ?>">
                        <input type="hidden" name="mKey" value="<?php echo $mKey ?>">
                        <input type="hidden" name="currency" value="WON">


                        <label class="col-10 col-sm-2 input param" style="border:none;">goodname</label>
                        <label class="col-10 col-sm-9 input">
                            <input type="text" name="goodname" value="<?php echo $_REQUEST["wp_itemnm"] ?> (테스트금액결제)">
                        </label>

                        <label class="col-10 col-sm-2 input param" style="border:none;">buyername</label>
                        <label class="col-10 col-sm-9 input">
                            <input type="text" name="buyername" value="topup">
                        </label>

                        <label class="col-10 col-sm-2 input param" style="border:none;">buyertel</label>
                        <label class="col-10 col-sm-9 input">
                            <input type="text" name="buyertel" value="01012345678">
                        </label>

                        <label class="col-10 col-sm-2 input param" style="border:none;">buyeremail</label>
                        <label class="col-10 col-sm-9 input">
                            <input type="text" name="buyeremail" value="test@test.com">
                        </label>

                        <!--input type="hidden" name="returnUrl" value="http://58.229.180.228/plugin/wpay/wpay_pc_return.php"-->
                        <!--input type="hidden" name="closeUrl" value="http://58.229.180.228/plugin/wpay/close.php"-->
                        <input type="hidden" name="returnUrl" value="https://dev.denb.co.kr/plugin/wpay/demo_wpay_req.php">
                        <input type="hidden" name="closeUrl" value="https://dev.denb.co.kr/plugin/wpay/close.php">

                        <label class="col-10 col-sm-2 input param" style="border:none;">acceptmethod</label>
                        <label class="col-10 col-sm-9 input">
                            <input type="text" name="acceptmethod" value="SKIN(ORIGINAL):HPP(1)">
                        </label>

                    </div>
                </form>

                <button onclick="on_wpay();" class="btn_solid_pri col-6 mx-auto btn_lg d-none" style="margin-top:50px">결제하기</button>

                <p style="color: #ccc; display: flex; justify-content: space-around; margin-top: 10vh;">
                    이창이 저절로 닫기지 않는 경우<br />
                    (결제가 실패하는 경우 등)<br />
                    닫기 버튼으로 이 창을 닫으십시오.
                </p>
                <p style="color: #ccc; display: flex; justify-content: space-around;">
                    <?= $_REQUEST["wp_mode"] ?>
                    <?
                    if ($result)
                        echo "PG 바인딩 성공";
                    ?>
                </p>

                <button onclick="self.close();" class="btn_solid_pri col-6 mx-auto btn_lg" style="margin-top:50px">닫기</button>

            </div>
        </section>

    </main>

</body>

</html>