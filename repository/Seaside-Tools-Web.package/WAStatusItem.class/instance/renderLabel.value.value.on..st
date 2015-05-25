rendering
renderLabel: aLabelString value: aFirstObject value: aSecondObject on: html
	html tableRow: [
		self renderLabel: aLabelString on: html.
		self renderValue: aFirstObject on: html.
		self renderValue: aSecondObject on: html ]