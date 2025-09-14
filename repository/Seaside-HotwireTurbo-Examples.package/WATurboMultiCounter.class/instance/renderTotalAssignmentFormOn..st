rendering
renderTotalAssignmentFormOn: html

	| theValue |
	html form
		turboAction: 'replace';
		turboStreamCallback: [ :ts | 
			ts replace: 'id-total' with: totals.
			counters do: [ :c | ts replaceComponent: c with: c ] ];
		with: [ 
			html textInput 
				callback: [ :value | theValue := value ].
			html submitButton
				callback: [ self setCountersTo: theValue ] ]