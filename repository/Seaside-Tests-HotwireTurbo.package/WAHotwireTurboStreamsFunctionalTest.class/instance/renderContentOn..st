rendering
renderContentOn: html

	| text |
	html form
		turboStreamCallback: [ :ts | ts append: #text with: [:innerHtml | innerHtml text: text ] ];
		with: [ 
			html textInput
				placeholder: 'Type something there';
				callback: [ :value | text := value ].
				
		html submitButton
			value: 'Append!' ].
		
	html paragraph id: #text