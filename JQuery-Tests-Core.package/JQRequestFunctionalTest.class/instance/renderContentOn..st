rendering
renderContentOn: html
	html form: [ 
		self renderText: 'Field 1' on: html.
		self renderText: 'Field 2' on: html.
		html div 
			id: 'logger';
			class: 'code'.
		html paragraph: [
			self renderButton: 'Get' ajax: html jQuery get on: html.
			self renderButton: 'Script' ajax: html jQuery getScript on: html.
			self renderButton: 'Post' ajax: html jQuery post on: html ] ]