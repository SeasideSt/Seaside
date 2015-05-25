rendering
renderRow: anObject named: aString group: aRadioGroup on: html
	| radioButton |
	html tableRow: [
		html tableHeading: [
			radioButton := aRadioGroup radioButton
				ensureId;
				value: aString;
				yourself.
			html label for: radioButton id; with: [
				(self isPrimitiveType: anObject)
					ifTrue: [ html text: aString ]
					ifFalse: [
						html anchor
							callback: [ self chooseObject: anObject named: aString ];
							with: aString ] ] ].
		html tableData: (anObject printStringLimitedTo: 100) ]