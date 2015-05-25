rendering
renderLabel: aLabelString value: aFirstObject value: aSecondObject value: aThirdObject on: html
	html tableRow: [
		self renderLabel: aLabelString on: html.
		self renderValue: aFirstObject on: html.
		self renderValue: aSecondObject on: html.
		self renderValue: aThirdObject on: html ]