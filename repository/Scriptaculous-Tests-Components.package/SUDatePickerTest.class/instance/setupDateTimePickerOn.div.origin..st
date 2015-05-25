rendering
setupDateTimePickerOn: theId div: divId origin: originString 
	timeComponent ifNil: 
		[ timeComponent := SUDateTimePicker 
			on: theId
			container: divId ].
	timeComponent format: #(1 2 3 $. 1 1).
	timeComponent setOriginWith: originString