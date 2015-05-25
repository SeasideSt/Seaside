rendering
renderContentOn: html	
	html textInput
		value: date;
		callback: [ :value | date := value ];
		script: (html jQuery new datepicker
			onSelect: (html jQuery ajax serializeThis))