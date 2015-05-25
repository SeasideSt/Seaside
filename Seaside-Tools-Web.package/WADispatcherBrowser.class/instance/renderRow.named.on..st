rendering-rows
renderRow: anEntryPoint named: aString on: html
	html tableRow: [
		html tableData: [ self renderRowName: anEntryPoint named: aString on: html ].
		html tableData: [ self renderRowDescription: anEntryPoint named: aString on: html ].
		html tableData: [ self renderRowActions: anEntryPoint named: aString on: html ] ]