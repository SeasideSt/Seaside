convenience
serializeFileUpload: aQuery

	"Upload the file in the field identified by aQuery using FormData. Cannot be composed with any other callback."
	
	self hasCallback ifTrue: [ self error: 'serializeFileUpload callback cannot be combined with other callbacks.' ].
	
	self
		addParameter: (JSStream on: '(function(){ 
				var formdata = new FormData();
				formdata.append(',(aQuery copy attributeAt: 'name') asJavascript,',',aQuery asJavascript,'[0].files[0]);
				return formdata})()');
		url: self renderContext actionUrl;
		type: 'POST';
		cache: false;
		processData: false;
		contentType: false