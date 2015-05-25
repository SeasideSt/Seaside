accessing
id
	^ id ifNil: [ JSStream on: 'this' ]