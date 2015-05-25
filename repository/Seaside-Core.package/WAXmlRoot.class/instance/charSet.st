accessing
charSet
	^ charSet ifNil: [ charSet := self class defaultCharSet ]