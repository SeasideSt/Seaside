rendering
renderExceptionOn: html
	| problems |
	problems := self exception seasidePossibleCauses.
	problems isEmpty ifTrue: [ ^ self ].
	html heading level: 3; with: 'Possible Causes'.
	html unorderedList list: problems