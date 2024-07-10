<?php
/*
 * @Date: 2021-09-03 11:01:11
 * @LastEditors: OTTOLIM
 * @LastEditTime: 2023-01-06 11:27:43
 * @FilePath: \denb\plugin\KTsms\Common.php
 */
	require_once 'class/Message.php';
	$apiKey = "189A4B6FED76CE40457640FE3234CD21";		//발급받은 api key
	$userKey = "pwkt181";		//사용자가 설정하는 key
	$apiPW = "dbkt100!";		//발급받은 api password
	$apiCenter = 3;		//1센터 -> 1 , 2센터 -> 2 , 차세대 -> 3
	$isDev = false;		//개발용 사용 여부 true / false
	$Message = new Message($apiKey, $apiPW, $userKey, $isDev, $apiCenter);