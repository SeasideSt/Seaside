rendering
renderContentOn: html 
	| currentList fullList listSize |
	fullList := self fullList.
	listSize := (fullList size min: 30) max: 5.
	html div
		class: 'groupContent';
		with: [
			html heading
				level2;
				with: 'Configure attribute: ' , attribute key.
			html form: [
				self renderActionsOn: html.
				html paragraph.
				html table: [
					html tableRow: [
						html tableData
							verticalAlign: 'top';
							with: [
								html label: 'Available'.
								html break.
								html multiSelect
									list: fullList;
									selected: selections;
									size: listSize;
									callback: [ :v | self selections: v ] ].
						html tableData
							verticalAlign: 'middle';
							with: [ self renderMoveActionsOn: html ].
						html tableData
							verticalAlign: 'top';
							with: [
								html label: 'Current'.
								html break.
								currentList := self currentList.
								currentList isEmpty 
									ifTrue: [ html text: '(empty)' ]
									ifFalse: [
										html multiSelect
											list: currentList;
											disabled: self isWriteable not;
											selected: selectionsCurrent;
											labels: [ :each | (self optionForValue: each value) greaseString, ' [', each key greaseString, ']' ];
											size: listSize;
											callback: [ :v | self selectionsCurrent: v ] ] ].
						html tableData
							verticalAlign: 'middle';
							with: [ self renderMoveUpAndDownOn: html ] ] ].
				html submitButton
					callback: [ self answer ];
					with: 'OK' ] ]