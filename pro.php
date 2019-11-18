<?php
	$servername = "localhost";
	$username = "inventoryUser";
	$password = "password";
	$dbname = "shop_inventory";

	// // Create connection
	$conn = mysqli_connect($servername, $username, $password, $dbname);
	if (mysqli_connect_errno()) {
		echo mysqli_connect_error();
		exit();
	} else {
		//echo "conected";
		
		// Select the member from the users table
		// $sql = 'SELECT max(itemNumber)+1 as itemNumber FROM item ';
		// $user_query = mysqli_query($conn, $sql);
		// // Now make sure that user exists in the table
		// $numrows = mysqli_num_rows($user_query);
		// if($numrows < 1){
			// echo "That user does not exist or is not yet activated, press back";
			// exit();	
		// }
		
		// // Fetch the user row from the query above
		// while ($row = mysqli_fetch_array($user_query, MYSQLI_ASSOC)) {
			// $pid = $row["itemNumber"];
			
		// }
		// echo "count is ".$pid;
	}
	
	if(isset($_POST["purchaseName"])){ 
	
		$name = trim($_POST["purchaseName"]);
				
		$output = '';
		$itemNumberString = '%' . htmlentities($_POST['purchaseName']) . '%';
				
		// Select the member from the users table
		$sql = "SELECT itemName FROM item WHERE itemName LIKE '{$itemNumberString}' ";
		$user_query = mysqli_query($conn, $sql);
		// // Now make sure that user exists in the table
		$numrows = mysqli_num_rows($user_query);
		if($numrows > 0){
			$output = '<ul class="list-unstyled suggestionsList" id="purchaseDetailsPurchaseItemNameSuggestionsList">';
			$id = 1;
			// Fetch the user row from the query above
			while ($row = mysqli_fetch_array($user_query, MYSQLI_ASSOC)) {
				$output .= '<li onclick="PopulatePurchaseDetailsAll(this.innerHTML)">' . $row['itemName'] . '</li>';
			}
			echo '</ul>';
			// exit();	
		} else {
			$output = '';
		}
		echo $output;
		exit;
	}
	
	if(isset($_POST['purchaseNameDetails'])){
		
		
	$purchaseName = htmlentities($_POST['purchaseNameDetails']);
		
	$purchaseDetailsSql = "SELECT * FROM item WHERE itemName = '{$purchaseName}' limit 1";
	
	//echo $purchaseDetailsSql; exit;
		$user_query = mysqli_query($conn, $purchaseDetailsSql);
		
		$numrows = mysqli_num_rows($user_query);
		
		if($numrows > 0){
			while ($row = mysqli_fetch_array($user_query, MYSQLI_ASSOC)) {
				$itemN = $row["itemNumber"];
				$itemS = $row["stock"];
				
				//echo $itemN." ".$itemS;
				echo json_encode($row);
				
				//print_r( $row);
			}
			//echo json_encode($numrows);
		}else {echo "error";}
	}

	if(isset($_POST["saleName"])){ 
	
		$name = trim($_POST["saleName"]);
				
		$output = '';
		$itemNumberString = '%' . htmlentities($_POST['saleName']) . '%';
				
		// Select the member from the users table
		$sql = "SELECT itemName FROM item WHERE itemName LIKE '{$itemNumberString}' ";
		$user_query = mysqli_query($conn, $sql);
		// // Now make sure that user exists in the table
		$numrows = mysqli_num_rows($user_query);
		if($numrows > 0){
			$output = '<ul class="list-unstyled suggestionsList" id="saleDetailsItemNameSuggestionsDiv">';
			$id = 1;
			// Fetch the user row from the query above
			while ($row = mysqli_fetch_array($user_query, MYSQLI_ASSOC)) {
				$output .= '<li onclick="PopulateSaleDetailsAll(this.innerHTML)">' . $row['itemName'] . '</li>';
			}
			echo '</ul>';
			// exit();	
		} else {
			$output = '';
		}
		echo $output;
		exit;
	}

	if(isset($_POST['saleNameDetails'])){
		
		
	$saleName = htmlentities($_POST['saleNameDetails']);
		
	$saleNameSql = "SELECT * FROM item WHERE itemName = '{$saleName}' limit 1";
	
	//echo $purchaseDetailsSql; exit;
		$user_query = mysqli_query($conn, $saleNameSql);
		
		$numrows = mysqli_num_rows($user_query);
		
		if($numrows > 0){
			while ($row = mysqli_fetch_array($user_query, MYSQLI_ASSOC)) {
				$itemN = $row["itemNumber"];
				$itemS = $row["stock"];
				
				//echo $itemN." ".$itemS;
				echo json_encode($row);
				
				//print_r( $row);
			}
			//echo json_encode($numrows);
		}else {echo "error";}
	}

	if(isset($_POST['itemNameDetails'])){
		
		
	$itemName = htmlentities($_POST['itemNameDetails']);
		
	$itemNameSql = "SELECT * FROM item WHERE itemName = '{$itemName}' limit 1";
	
	//echo $purchaseDetailsSql; exit;
		$user_query = mysqli_query($conn, $itemNameSql);
		
		$numrows = mysqli_num_rows($user_query);
		
		if($numrows > 0){
			while ($row = mysqli_fetch_array($user_query, MYSQLI_ASSOC)) {
				$itemN = $row["itemNumber"];
				$itemS = $row["stock"];
				
				//echo $itemN." ".$itemS;
				echo json_encode($row);
				
				//print_r( $row);
			}
			//echo json_encode($numrows);
		}else {echo "error";}
	}

	
?>