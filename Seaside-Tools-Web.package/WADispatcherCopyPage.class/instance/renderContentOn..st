rendering
renderContentOn: html 
	html heading
		level: 2;
		with: 'Copy request handler: ' , self handler name.
	html form: [
		html table: [
			html tableRow: [
				html tableData
					class: 'label';
					with: 'Name for new request handler: '.
				html tableData:  [
					html textInput
						value: handler name , '_copy';
						callback: [ :value | name := value ] ] ] ].
		html break.
		html submitButton
			callback: [ self copyHandler ];
			with: 'OK'.
		html space.
		html submitButton
			callback: [ self answer: nil ];
			with: 'Cancel' ]