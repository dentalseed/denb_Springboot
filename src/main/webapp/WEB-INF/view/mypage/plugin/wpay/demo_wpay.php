<?php
/*
 * @Date: 2023-04-18 17:45:50
 * @LastEditors: OTTO
 * @LastEditTime: 2023-11-01 18:33:13
 * @Description: 
 * 
 */
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
// orderNum   : 거래일련번호
// orderPrice : 결제금액
// orderTid   : 거래일련번호(유니크ID - 거래번호와 동일하거나 추가 필요한 정보)
$result_json = json_decode(rawurldecode($_REQUEST["order_info"]));
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
    <script>
        function go_wpay() {
            document.form_wpay.action = '/plugin/wpay/wpay_web_req.php';
            document.form_wpay.target = "_self";
            document.form_wpay.submit();
        }
    </script>
</head>

<body class="wrap">
    <!-- 본문 -->
    <main class="col-8 cont" id="bill-01">
        <!-- 카드CONTENTS -->
        <section class="menu_cont mb-5">
            <div class="card">
                <form id="form_wpay" name="form_wpay" method="post">
                    <input type="hidden" name="version" value="1.0" />
                    <input type="hidden" name="gopaymethod" value="Card" />
                    <input type="hidden" name="mid" value="welcometst" />
                    <input type="hidden" name="wp_orderno" id="wp_orderno" value="<?= $result_json->orderNum ?>" />
                    <input type="hidden" name="wp_price" value="<?= $result_json->orderPrice ?>" />
                    <input type="hidden" name="wp_itemcd" id="wp_buyItemcd" value="CPPRD123456789" />
                    <input type="hidden" name="wp_reqamt" id="wp_buyReqamt" value="1000" />
                    <input type="hidden" name="wp_itemnm" id="wp_buyItemnm" value="CPPRODUCT01" />
                    <input type="hidden" name="buyername" value="홍길동" />
                    <input type="hidden" name="buyertel" id="wp_buyerTel" value="01012341234" />
                    <input type="hidden" name="buyeremail" id="wp_buyerEmail" value="test@test.com" />
                    <input type="hidden" name="returnUrl" value="/plugin/wpay/demo_wpay_req.php" />
                    <input type="hidden" name="closeUrl" value="/plugin/wpay/close.php" />
                    <input type="hidden" name="acceptmethod" value="SKiN(ORIGINAL):HPP(1)" />
                    <input type="hidden" name="wp_cpid" value="<?= $result_json->orderTid ?>" />
                    <input type="hidden" name="wp_mode" value="demo1" />
                </form>
                <button onclick="go_wpay();" class="btn_solid_pri col-6 mx-auto btn_lg" style="margin-top:50px">결제하기</button>
                <button onclick="self.close();" class="btn_solid_pri col-6 mx-auto btn_lg" style="margin-top:50px">닫기</button>
            </div>
        </section>
    </main>
</body>

</html>