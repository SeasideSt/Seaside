tests
testWrapping
	| cr body lf crlf |
	cr := String with: Character cr.
	lf := String with: Character lf.
	crlf := cr , lf.
	body := WAStringEmailBody 
		string: '1111 222 2 33'
		lineLength: 5.
	self assert: ('1111' , cr , '222 2' , cr , '33') = body greaseString.
	body := WAStringEmailBody 
		string: '0123456789'
		lineLength: 5.
	self assert: ('01234' , cr , '56789') = body greaseString.
	body := WAStringEmailBody 
		string: '012345678'
		lineLength: 5.
	self assert: ('01234' , cr , '5678') = body greaseString.
	body := WAStringEmailBody 
		string: '01234567890'
		lineLength: 5.
	self assert: ('01234' , cr , '56789' , cr , '0') = body greaseString.
	body := WAStringEmailBody 
		string: '0123456789' , crlf , crlf , '0123456789'
		lineLength: 5.
	self assert: ('01234' , cr , '56789' , cr , cr , '01234' , cr , '56789') = body greaseString