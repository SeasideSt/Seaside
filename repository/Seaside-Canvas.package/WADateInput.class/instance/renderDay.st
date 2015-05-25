private-rendering
renderDay
	| brush |
	brush := canvas textInput
		id: (self id isNil ifFalse: [ self id , '-day' ]);
		value: (GRNumberPrinter new
				padding: $0;
				digits: 2;
				print: day);
		yourself.
	self addDayCallbackToBrush: brush.
	brush
		attributeAt: 'size'
			put: 2;
		attributeAt: 'maxlength'
			put: 2