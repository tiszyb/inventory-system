<?php
	$itemDetailsSql = 'SELECT * FROM item';
	$itemDetailsStatement = $conn->prepare($itemDetailsSql);
	$itemDetailsStatement->execute();
	
	if($itemDetailsStatement->rowCount() > 0) {
		while($row = $itemDetailsStatement->fetch(PDO::FETCH_ASSOC)) {
			echo '<option onclick="PopulateSaleDetailsAll(this.innerHTML)">' . $row['itemName'] . '</option>';
		}
	}
	$itemDetailsStatement->closeCursor();
?>