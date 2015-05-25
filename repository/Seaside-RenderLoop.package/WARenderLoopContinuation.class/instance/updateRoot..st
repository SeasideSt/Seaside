updating
updateRoot: anHtmlRoot
	| charSet |
	charSet := self application contentType charSet.
	charSet isNil ifFalse: [
		anHtmlRoot meta charset: charSet ].
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'Seaside'.
	self application libraries 
		do: [ :each | each default updateRoot: anHtmlRoot ].
	self session updateRoot: anHtmlRoot