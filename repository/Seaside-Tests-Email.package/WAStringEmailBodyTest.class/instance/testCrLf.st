tests
testCrLf
	| cr lf crlf body |
	cr := String with: Character cr.
	lf := String with: Character lf.
	crlf := cr , lf.
	body := WAStringEmailBody contentString: 'hello' , crlf , 'world'.
	self assert: ('hello' , cr , 'world') = body greaseString