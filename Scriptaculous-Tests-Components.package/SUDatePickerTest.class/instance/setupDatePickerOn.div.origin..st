rendering
setupDatePickerOn: theId div: divId origin: originString 
	component ifNil: 
		[ component := SUDatePicker 
			on: theId
			container: divId ].
	component setOriginWith: originString