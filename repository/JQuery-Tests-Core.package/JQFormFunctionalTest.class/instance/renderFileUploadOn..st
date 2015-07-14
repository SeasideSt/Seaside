rendering-elements
renderFileUploadOn: html
	self
		renderLabel: 'File-Upload'
		control: [ :id :script |
			html fileUpload
				id: id;
				callback: [ :value | fileInput := value ].

			html submitButton
				onClick: (html jQuery ajax 
											serializeFileUpload: (html jQuery id: id);
											onSuccess: (((html jQuery id: id)	
																	parents: 'fieldset';
																	find: 'p') load html:[:h | h render: fileInput fileName, '(', fileInput size greaseString, ' bytes)' ]));
				with: 'Upload!' ]
		model: (fileInput ifNotNil:[fileInput fileName, '(', fileInput size greaseString, ' bytes)'])
		on: html