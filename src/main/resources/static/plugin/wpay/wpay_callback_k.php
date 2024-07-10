<?php
session_start();
header('Set-Cookie: PHPSESSID=' . session_id() . '; Path=/; SameSite=None; Secure; Content-type: text/html; charset=utf-8');
include_once('./_common.php');
include_once('./_common.user_order.php');
$sub_menu                = '980510';
include_once(IM_ORDER_PATH . '/lib.php');
include_once(IM_ORDER_PATH . '/lib.pay.php');

    $objJsonData = json_decode(file_get_contents('php://input'));

    if(empty($objJsonData))
    {
        $time = date("Y-m-d H:i:s");
        $msg = "[".$time."] "."{\"code\":9999, \"message\":\"Response data is empty\"}\n";
        $file_server_path = realpath(__FILE__);
        $php_filename = basename(__FILE__);
        $server_path = str_replace(basename(__FILE__), "", $file_server_path);
        $fp = fopen($server_path."callback.txt", 'a'); 
        $str = file_get_contents('php://input');
        fwrite($fp, $msg);
        fclose($fp);

        return;
    }

    $strUserID              = $objJsonData->user_id;                   
    $strUserName            = $objJsonData->user_name;                 
    $strOrderNo             = $objJsonData->order_no;                  
    $strServiceName         = $objJsonData->service_name;              
    $strProductName         = $objJsonData->product_name;              

    $strCustomParameter     = $objJsonData->custom_parameter;          
    $strTID                 = $objJsonData->tid;                       
    $strCID                 = $objJsonData->cid;                       
    $strAmt                 = $objJsonData->amount;                    
    $strPayInfo             = $objJsonData->pay_info;                  

    $strPGCode              = $objJsonData->pgcode;                    
    $strDomesticFlag        = $objJsonData->domestic_flag;             
    $strBillKey             = $objJsonData->billkey;                   
    $strTransactionDate     = $objJsonData->transaction_date;          
    $strCardInfo            = $objJsonData->card_info;                 

    $strPayHash             = $objJsonData->payhash;                   
    $strInstallMonth        = $objJsonData->install_month;             

    //-- code 값은 성공시 0, 실패시 0이 아닌 값
    echo "{\"code\":0, \"message\":\"success\"}";

    $file_server_path = realpath(__FILE__);
    $php_filename = basename(__FILE__);
    $server_path = str_replace(basename(__FILE__), "", $file_server_path);
    $fp = fopen($server_path."callback.txt", 'a');    
    $str = json_encode($objJsonData);
    $time = date("Y-m-d H:i:s");
    $msg = "[".$time."] ".$str."\n";
    fwrite($fp, $msg);              


    function unescape_unicode($str) {
		return preg_replace_callback('/\\\\u([0-9a-fA-F]{4})/', function ($match) {
		    return mb_convert_encoding(pack('H*', $match[1]), 'UTF-8', 'UCS-2BE');
		}, $str);
	}

    $qry  = " insert into pay_tran_log (";
    $qry .= " tid, result_code, result_msg, moid, tot_price";
    $qry .= " ) values (";
    $qry .= " '{$objJsonData->tid}', '{$objJsonData->result_code}', '{$objJsonData->result_msg}', '{$objJsonData->moid}', '{$objJsonData->tot_price}'";
    $qry .= " )";
//    $msg = "[".$time."] ".$qry."\n";
//    fwrite($fp, $msg);
    sql_query($qry);

    // 거래 상태값 변경
    $tk_mb = sql_fetch("select * from pay_tran_log where tid='{$objJsonData->tid}' limit 1");
$var = print_r($tk_mb, true);
$msg = "[".$time."] ".$var."\n";
fwrite($fp, $msg);

    if( $tk_mb != null )
    {
        $qry  = " update pay_tran_log set";
        $qry .= "  tr_stat = 'PAID'";
        $qry .= "  where tid = '{$objJsonData->tid}'";
$msg = "[".$time."] ".$qry."\n";
fwrite($fp, $msg);
        sql_query($qry);
$msg = "[".$time."] sql_query() closed!\n";
fwrite($fp, $msg);
    }

//    $msg = "[".$time."] sql_query() closed!\n";
//    fwrite($fp, $msg);
    fclose($fp);
?>