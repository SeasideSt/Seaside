rendering
renderInputForCookie: aSymbol on: html
	html tableData: [
		html textInput
			on: (aSymbol, #Key) asSymbol of: self ].
	html tableData: [
		html textInput
			on: (aSymbol, #Value) asSymbol of: self ].
	html tableData: [
		html textInput
			on: (aSymbol, #Path) asSymbol of: self ].
	html tableData.
	html tableData