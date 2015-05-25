rendering
renderContentOn: html
	self renderExplanationOn: html.
	wasExecuted
		ifTrue: [ self renderExecutedOn: html ]
		ifFalse: [ self renderNotExecutedOn: html ]