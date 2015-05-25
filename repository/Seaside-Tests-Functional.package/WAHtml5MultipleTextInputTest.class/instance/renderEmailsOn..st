rendering
renderEmailsOn: html
	emails isNil ifTrue: [ ^ self ].
	html unorderedList
		list: emails