convenience
serializeFileUpload: aQuery

	"Upload the file in the field identified by aQuery using FormData. Cannot be composed with any other callback."
	
	self
		data:
			((((JSStream on: 'var formdata = new FormData()'),
			 ((aQuery copy attributeAt: 'name') assignLocalTo: 'name'),
			 (((aQuery property: 0) access: 'files') assignLocalTo: 'files'),
			 (JSStream on:'for(i=0;i<files.length;i++) formdata.append(name,files[i])'),
			 (JSStream on: 'return formdata')) asFunction) apply: #());
		url: self renderContext actionUrl;
		type: 'POST';
		cache: false;
		processData: false;
		contentType: false