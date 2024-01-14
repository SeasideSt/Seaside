rendering
renderTotalAssignmentFormOn: html

	| theValue |
	html form
		turboStreamCallback: [ :ts | ts replace: 'id-total' with: totals ];
		with: [ 
			html textInput 
				callback: [ :value | theValue := value ].
			html submitButton
				callback: [ self setCountersTo: theValue ] ]