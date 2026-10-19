rendering
renderContentOn: html
	html form: [ 
		self renderText: 'Field 1' on: html.
		self renderText: 'Field 2' on: html.
		html paragraph
			class: 'hint';
			with: 'Deferred callback demo: Get/Script/Post exercise success-path deferred callbacks ("done" + "always"); Failing Request exercises failure-path callbacks ("fail" + "always").'.
		html div 
			id: 'logger';
			class: 'code'.
		html paragraph: [
			self renderButton: 'Get' ajax: html jQuery get on: html.
			self renderButton: 'Script' ajax: html jQuery getScript on: html.
			self renderButton: 'Post' ajax: html jQuery post on: html.
			self renderFailButtonOn: html ] ]