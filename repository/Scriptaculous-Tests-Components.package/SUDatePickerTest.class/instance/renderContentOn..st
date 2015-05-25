rendering
renderContentOn: html
	| theId divId theId2 | 
	component := nil.
	timeComponent := nil.
	theId := html nextId.
	divId := html nextId.
	theId2 := html nextId.
	html div id: divId.
	html form: [
		html table: [
				html tableRow: [
					html tableData: [ html textInput id: theId ].
					html tableData: [
						html button value: 'Set date';
							onClick: (html prototype evaluator
								callback: [ :v | self setupDatePickerOn: theId div: divId origin: v ] value: (html prototype element id: theId; cumulativeOffset);
								callback: [ :script | self openDatePickerOn: script ];
											return: false) ] ].
				html tableRow: [
					html tableData: [ html textInput id: theId2 ].
					html tableData: [
						html button value: 'Set date & time';
							onClick: (html prototype evaluator
								callback: [ :v | self setupDateTimePickerOn: theId2 div: divId origin: v ] value: (html prototype element id: theId2; cumulativeOffset);
								callback: [ :script | self openDateTimePickerOn: script ];
											return: false) ] ] ] ]
