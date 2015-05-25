private-rendering
renderYear
	| brush |
	brush := canvas textInput
		id: (self id isNil ifFalse: [ self id , '-year' ]);
		value: (GRNumberPrinter new
				padding: $0;
				digits: 4;
				print: year);
		yourself.
	self addYearCallbackToBrush: brush.
	brush
		attributeAt: 'size'
			put: 4;
		attributeAt: 'maxlength'
			put: 4