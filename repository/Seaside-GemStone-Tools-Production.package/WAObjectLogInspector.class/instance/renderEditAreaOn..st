rendering
renderEditAreaOn: html
	html textArea
		value: input;
		callback: [ :value | input := value ].
	html break.
	self actions do: [ :each |
		html submitButton
			callback: [ self perform: each ];
			text: each ]