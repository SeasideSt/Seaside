updating
updateRoot: anHtmlRoot
	anHtmlRoot meta contentType: self application contentType.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'Seaside'.
	self application libraries 
		do: [ :each | each default updateRoot: anHtmlRoot ].
	self session updateRoot: anHtmlRoot