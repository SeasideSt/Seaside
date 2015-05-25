rendering
renderContentOn: html
	self isSupported
		ifTrue: [ self renderImagesOn: html ]
		ifFalse: [ self renderNotSupportedOn: html ]