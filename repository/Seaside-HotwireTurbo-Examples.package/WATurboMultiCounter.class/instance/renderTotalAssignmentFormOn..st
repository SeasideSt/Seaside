rendering
renderTotalAssignmentFormOn: html

	| theValue |
	html form
		turboStreamCallback: [ :ts |  self halt. ];
		with: [ 
			html textInput 
				callback: [ :value | theValue := value ].
			html submitButton
				turboTarget: 'id-total';
				callback: [ self setCountersTo: theValue ] ]