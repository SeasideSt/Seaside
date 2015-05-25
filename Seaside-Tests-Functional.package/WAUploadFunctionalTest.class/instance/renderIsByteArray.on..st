rendering
renderIsByteArray: aCollection on: html
	aCollection isString ifTrue: [
		html strong: 'fail: raw contents of WAFile should be a ByteArray not a String' ]