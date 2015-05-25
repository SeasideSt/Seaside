tests
testBasics
	| body |
	body := WAStringEmailBody contentString: 'hello'.
	self assert: body isPlainText.
	self assert: body contentString equals: 'hello'.
	self assert: body contentType equals:WAMimeType textPlain