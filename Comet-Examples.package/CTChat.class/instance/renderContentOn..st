rendering
renderContentOn: html
	html heading: 'Seaside Chat'.
	self isLoggedIn
		ifTrue: [ self renderChatOn: html ]
		ifFalse: [ self renderLoginOn: html ]