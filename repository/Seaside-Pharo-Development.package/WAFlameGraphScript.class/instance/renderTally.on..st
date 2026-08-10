rendering
renderTally: aMessageTally on: js
	| receivers |
	js object: [ 
		js key: 'name' value: aMessageTally printString.
		js key: 'value' value: aMessageTally tally.
		receivers := aMessageTally receivers.
		receivers isEmptyOrNil ifFalse: [ 
			 js key: 'children' value: [ 
				js array: [ 
					receivers do: [ :each |
						js value: [ 
							self renderTally: each on: js  ] ] ] ] ] ]