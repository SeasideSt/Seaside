rendering
renderContentOn: html

	html form
		turboStreamCallback: [ :ts | ts append: #text with: [:innerHtml | self renderTextOn: innerHtml ] ];
		with: [ 
			html textInput
				placeholder: 'Type something there';
				callback: [ :value | text := value ].
				
		html submitButton
			value: 'Append!' ].
		
	html paragraph id: #text