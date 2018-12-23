rendering
renderContentOn: html
	html table: [
		html tableRow: [
			html tableData: [ self renderMouseButtonOn: html ].
			html tableData: [ self renderToggleZoomOn: html ].
			html tableData: [ self renderToggleUIProcessOn: html ] ] ].
	self renderMouseClickOn: html.
	html horizontalRule