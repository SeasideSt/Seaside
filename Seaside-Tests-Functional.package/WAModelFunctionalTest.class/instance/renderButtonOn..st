rendering
renderButtonOn: html
	| action |
	action := state == #ON ifTrue: [ #logoff ] ifFalse: [ #logon ].
	html div: [
		"div for validation"
		html submitButton
			on: action of: self ]