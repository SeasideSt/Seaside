initialization
renderContentOn: html

	| theValue |
	self renderTurboScriptOn: html.
	html div id: #foo.
	counters
		do: [ :each | html render: each ]
		separatedBy: [ html horizontalRule ].
	html horizontalRule; horizontalRule.
	html render: totals.
	html form: [
		html textInput
			callback: [ :value | theValue := value ].
		html submitButton
			turboTarget: 'id-total';
			turboCallback: [ self setCountersTo: theValue ] ]