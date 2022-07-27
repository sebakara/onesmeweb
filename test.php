<?php
session_start();
error_reporting(0);
// include('includes/config.php');

$filepath = realpath(dirname(__FILE__));
include_once ($filepath.'/lib/Database.php');
$db = new Database();
$mailquery = "SELECT * FROM tbl_customer WHERE id = '".$_SESSION['cmrId']."'";
$result = $db->select($mailquery);
$value = $result->fetch_assoc();

$orders = "SELECT id,price,productName FROM tbl_order WHERE cmrId='".$value['id']."' and status='0'";
$orderresult = $db->select($orders);
$reference = "payment_" . substr(hash('sha256', mt_rand() . microtime()), 0, 20);
$totalprices = 0;
while($valueorder = $orderresult->fetch_assoc()){
    $db->insert("insert into tbl_transactions
    (order_id,tx_ref,transaction_id,status) 
    values('".$valueorder['id']."','$reference','','PENDING')");
    $totalprices +=$valueorder['price'];
    // echo "id: ".$valueorder['id']." price:  ".$valueorder['price']."</br>";
}
// echo "total: ".$totalprices;`

    $curl = curl_init();
    $request = [
    'tx_ref' => $reference,
    'amount' => $totalprices,
    'currency' => 'RWF',
    'payment_options' => 'Phone',
    'redirect_url' => 'https://luxdeionlineshop.com/back.php',
    'customer' => [
        'email' => $value['email'],
        'name' =>  $value['name']
    ],
    'meta' => [
        'price' => $totalprices
    ],
    'customizations' => [
        'title' => 'Ishyura igicuruzwa',
        'description' => 'Pay for your fees'
    ]
];
    $request = json_encode($request);
    curl_setopt_array($curl, array(
      CURLOPT_URL => "https://api.flutterwave.com/v3/payments",
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_ENCODING => "",
      CURLOPT_MAXREDIRS => 10,
      CURLOPT_TIMEOUT => 0,
      CURLOPT_FOLLOWLOCATION => true,
      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
      CURLOPT_CUSTOMREQUEST => "POST",
      CURLOPT_POSTFIELDS => $request,
      CURLOPT_HTTPHEADER => array(
        "Authorization: Bearer FLWSECK-382f4c1c2a61ed059ceaa5501a060bf9-X",
        "Content-Type: application/json"
      ),
    ));
    // FLWSECK_TEST-cc17777a9b44854d432485713ad1dff4-X
    
    $response = curl_exec($curl);
    curl_close($curl);
    $extjs = json_decode($response,true);
    header('Location: '.$extjs['data']['link']);
    
?>