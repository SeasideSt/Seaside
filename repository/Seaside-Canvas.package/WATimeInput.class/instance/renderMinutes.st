private-rendering
renderMinutes
	| brush |
	brush := canvas textInput
		id: (self id isNil ifFalse: [ self id , '-mins' ]);
		value: (GRNumberPrinter new
				padding: $0;
				digits: 2;
				print: minutes);
		yourself.
	self addMinutesCallbackToBrush: brush.
	brush
		attributeAt: 'size'
			put: 2;
		attributeAt: 'maxlength'
			put: 2