accessing-files
handlerJs
	^ 'function submitForm(element) {
	var hidden = document.createElement("input");
	hidden.name = /[?&](\d+)/.exec(element.href)[1];
	hidden.type = "hidden"; hidden.value = "";
	while (element && element.tagName != "FORM")
		element = element.parentNode;
	element.appendChild(hidden);
	element.submit();
	return false;
}'