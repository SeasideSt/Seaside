user interface
portFromUserFor: adaptor

	^ (UIManager default
		request: 'Enter a port number' 
		initialAnswer: adaptor defaultPort greaseString)
		ifNotNil: [:answer | 
			(answer notEmpty and: [answer isAllDigits])
				ifTrue: [answer greaseInteger]]