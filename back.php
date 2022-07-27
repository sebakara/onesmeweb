<?php
session_start();
error_reporting(0);
// include('includes/config.php');

$filepath = realpath(dirname(__FILE__));
include_once ($filepath.'/lib/Database.php');
$db = new Database();

$transquery = "SELECT * FROM tbl_transactions WHERE tx_ref = '".$_GET['tx_ref']."'";
$result = $db->select($transquery);
$orderId = array();
while($value = $result->fetch_assoc()){
    $orderId[] = $value['order_id'];
}
$idsorder = implode(",",$orderId);
if(strtoupper($_GET['status']) == 'SUCCESSFUL'){
    $db->update("UPDATE tbl_transactions SET status = '".$_GET['status']."',transaction_id='".$_GET['transaction_id']."' where tx_ref='".$_GET['tx_ref']."'");
    $db->update("UPDATE tbl_order SET status='1' WHERE id in ($idsorder)");
}
else{
    $db->update("UPDATE tbl_transactions SET status = '".$_GET['status']."' where tx_ref='".$_GET['tx_ref']."'");
}
header('Location: index.php');