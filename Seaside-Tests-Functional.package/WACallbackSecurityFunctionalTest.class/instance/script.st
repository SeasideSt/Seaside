hooks
script
^ '
function swapCallbacks(url, list1id, list2id) {
	list1 = document.getElementById(list1id);
	list2 = document.getElementById(list2id);
	
	document.location = url
		+ "&" + list1.name + "=" + list2.options[2].value
		+ "&" + list2.name + "=" + list1.options[2].value;
}
		
'