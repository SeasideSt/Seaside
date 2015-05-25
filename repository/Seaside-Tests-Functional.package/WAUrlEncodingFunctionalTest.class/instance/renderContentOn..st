rendering
renderContentOn: html
	self renderExplanationOn: html.

	html form
		get;
		with: [
			html div: [
				html textInput
					on: #input of: self.
				html submitButton ] ].
		
	html definitionList: [
		html definitionTerm: 'Input'.
		html definitionData: self input.
		
		html definitionTerm: 'Parameter'.
		html definitionData: self parameter.
		
		html definitionTerm: 'Path'.
		html definitionData: self path ]