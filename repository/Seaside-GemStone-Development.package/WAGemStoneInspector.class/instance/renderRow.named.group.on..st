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
		html tableData: [ | str |
			str := anObject printStringLimitedTo: 100.
			str size > 90
				ifTrue: [
					html anchor
						callback: [ self displayFullPrintStringFor: anObject ];
						with: str]
				ifFalse: [
					html text: str]] ]