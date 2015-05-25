rendering
renderContentOn: html
	string notNil ifTrue: [ html anchor name: string ].
	
	html paragraph: 'Whatever you submit below should be added to the URL both as a path element and a fragment (the part after #).'.
	html form: [
		html div: [
			html textInput on: #string of: self.
			html submitButton ] ]