rendering-elements
renderMultiFileUploadOn: html

	| modelBlock |
	modelBlock := [ fileInputs notNil ifTrue: [
			String streamContents:[ :stream |
				fileInputs
					do: [ :file | 
						stream nextPutAll: file fileName, '(', file size greaseString, ' bytes)' ]
					separatedBy: [ stream nextPutAll: '--' ] ] ]
			ifFalse: [ nil ] ].
	
	self
		renderLabel: 'Multiple File-Upload'
		control: [ :id :script |
			html fileUpload
				id: id;
				multipleValuesCallback: [ :value | fileInputs := value ].

			html submitButton
				onClick: (html jQuery ajax 
											serializeFileUpload: (html jQuery id: id);
											onSuccess: (((html jQuery id: id)	
																	parents: 'fieldset';
																	find: 'p') load html: [ :h | h render: modelBlock value ]));
				with: 'Upload!' ]
		model: modelBlock value
		on: html