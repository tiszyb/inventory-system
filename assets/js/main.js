function ajaxObj( meth, url ) {
	var x = new XMLHttpRequest();
	x.open( meth, url, true );
	x.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	return x;
}
function ajaxReturn(x){
	if(x.readyState == 4 && x.status == 200){
	    return true;	
	}
}
function _(x){
	return document.getElementById(x);
}
const request = (body) => {
	return obj = {
		method: 'POST',
		headers: {'Content-Type': 'application/x-www-form-urlencoded' },
		body: body
	};
}

const PopulatePurchaseDetails = async() => {
	
	const purchaseName = _("purchaseDetailsItemName").value;
	const url = "pro.php";
	const Link = "purchaseName="+purchaseName; 
	
	//console.log(Link);
	if( purchaseName != ''){
		let Response = await fetch(url, request(Link));
		if(Response.ok){   
			Response = await Response.text();
			_("purchaseDetailsPurchaseItemNameSuggestionsDiv").style.display = "block";
			_("purchaseDetailsPurchaseItemNameSuggestionsDiv").style.opacity = "show";
			_("purchaseDetailsPurchaseItemNameSuggestionsDiv").innerHTML = Response;
			//console.log(Response);
			
		}
		
	} else {
		_("purchaseDetailsPurchaseItemNameSuggestionsDiv").style.display = "none";
		_("purchaseDetailsPurchaseItemNameSuggestionsDiv").style.opacity = "hide";
	}	
}

const PopulatePurchaseDetailsAll = async(data) => {
	//alert
	const purchaseNameDetails = data;
	const url = "pro.php";
	const Link = "purchaseNameDetails="+purchaseNameDetails; 
	
	//console.log(data);
	if( purchaseNameDetails != ''){
		let Response = await fetch(url, request(Link));
		if(Response.ok){
			jsonResponse = await Response.text();
			//alert(jsonResponse);
			//jsonObject = Object.assign({},jsonResponse);
			jsonObject = JSON.parse(jsonResponse);
			//alert(JSON.stringify(jsonObject));
			_("purchaseDetailsItemNumber").value = jsonObject.itemNumber;
			_("purchaseDetailsCurrentStock").value = jsonObject.stock;
			_("purchaseDetailsItemName").value = jsonObject.itemName;
		}
		console.log(jsonObject);
	} else {
		
	}	
}


const PopulateSaleDetails = async() => {
	const saleName = _("saleDetailsItemName").value;
	const url = "pro.php";
	const Link = "saleName="+saleName; 
	
	//alert(saleName);
	if( saleName != ''){
		let Response = await fetch(url, request(Link));
		if(Response.ok){   
			Response = await Response.text();
			_("saleDetailsItemNameSuggestionsDiv").style.display = "block";
			_("saleDetailsItemNameSuggestionsDiv").style.opacity = "show";
			_("saleDetailsItemNameSuggestionsDiv").innerHTML = Response;
			//console.log(Response);
			
		}
		
	} else {
		_("saleDetailsItemNameSuggestionsDiv").style.display = "none";
		_("saleDetailsItemNameSuggestionsDiv").style.opacity = "hide";
	}	
}


const PopulateSaleDetailsAll = async(data) => {
	console.log(data);
	
	const saleNameDetails = data;
	const url = "pro.php";
	const Link = "saleNameDetails="+saleNameDetails; 
	
	//console.log(data);
	if( saleNameDetails != ''){
		let Response = await fetch(url, request(Link));
		if(Response.ok){
			jsonResponse = await Response.text();
			//alert(jsonResponse);
			//jsonObject = Object.assign({},jsonResponse);
			jsonObject = JSON.parse(jsonResponse);
			//alert(JSON.stringify(jsonObject));
			_("saleDetailsItemNumber").value = jsonObject.itemNumber;
			_("saleDetailsTotalStock").value = jsonObject.stock;
			_("saleDetailsItemName").value = jsonObject.itemName;
			_("saleDetailsUnitPrice").value = jsonObject.unitPrice;
			setTimeout(() =>{
				_("saleDetailsCustomerID").value = 1;
				_("saleDetailsCustomerName").value = "Random Customer";
			}, 1000)
			
		}
		console.log(jsonObject);
	} else {
		
	}
}


const PopulateItemDetailsAll = async(data) => {
	console.log(data);
	
	const itemNameDetails = data;
	const url = "pro.php";
	const Link = "itemNameDetails="+itemNameDetails; 
	
	//console.log(data);
	if( itemNameDetails != ''){
		let Response = await fetch(url, request(Link));
		if(Response.ok){
			jsonResponse = await Response.text();
			//alert(jsonResponse);
			//jsonObject = Object.assign({},jsonResponse);
			jsonObject = JSON.parse(jsonResponse);
			//alert(JSON.stringify(jsonObject));
			_("itemDetailsItemNumber").value = jsonObject.itemNumber;
			_("itemDetailsTotalStock").value = jsonObject.stock;
			_("itemDetailsItemName").value = jsonObject.itemName;
			_("itemDetailsProductID").value = jsonObject.productID;
			_("itemDetailsDiscount").value = "";
			_("itemDetailsQuantity").value = "";
			_("itemDetailsUnitPrice").value = "";
		}
		console.log(jsonObject);
	} else {
		
	}
}


const popID = () => {
	//alert(1);
	_("saleDetailsCustomerID").value = 1;
	_("saleDetailsCustomerName").value = "Random Customer";
}