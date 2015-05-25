private-rendering
renderSeconds
	| brush |
	brush := canvas textInput
		id: (self id isNil ifFalse: [ self id , '-secs' ]);
		value: (GRNumberPrinter new
				padding: $0;
				digits: 2;
				print: seconds);
		yourself.
	self addSecondsCallbackToBrush: brush.
	brush
		attributeAt: 'size'
			put: 2;
		attributeAt: 'maxlength'
			put: 2