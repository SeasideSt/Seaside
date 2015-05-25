rendering
renderMessageOn: html
	message isNil
		ifFalse: [ html strong: message ]