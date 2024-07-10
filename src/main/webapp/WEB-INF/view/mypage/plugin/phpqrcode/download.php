<?
header("Content-Type: text/html; charset= UTF-8 ");
$folder = $_GET['folder'];
$file = $_GET['file'];
$ori_file = $_GET['ori_file'];

ob_start();
//$file_nm = iconv("UTF-8", "EUC-KR", $rs->file_nm); 
$file = trim(iconv('utf-8','euc-kr',$file));
//$ori_file = trim(iconv('utf-8','euc-kr',$ori_file));

$folder_nm = $folder;
//$downfiledir = "../upload/board/";
$downfiledir = $folder;
$filepath = $downfiledir;
$filepath = addslashes($filepath);

//header("Content-Type: text/html; charset=euc-kr");
header("Content-Type: application/octet-stream");
Header("Content-Disposition: attachment;; filename=\"".$ori_file."\"");
header("Content-Transfer-Encoding: binary"); 
//Header("Content-Length: ".(string)(filesize($downfiledir.$file_nm))); 
Header("Cache-Control: cache, must-revalidate");
header("Pragma: no-cache"); 
header("Expires: 0");
$fp = fopen($filepath.$file,'rb') ; 
	if (!fpassthru($fp)) {
	fclose($fp);
}
