rendering
renderContentOn: html
	self renderExplanationOn: html.

	html form
		get;
		with: [
			html div: [
				html textInput
					id: #input;
					on: #input of: self.
				html submitButton ] ].
		
	html definitionList: [
		html definitionTerm: 'Input'.
		html definitionData id: #inputresult; with: self input.
		
		html definitionTerm: 'Parameter'.
		html definitionData id: #parameterresult; with: self parameter.
		
		html definitionTerm: 'Path'.
		html definitionData id: #pathresult; with: self path ]