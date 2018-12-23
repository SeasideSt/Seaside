rendering
renderProcess: aProcess on: html
	html tableRow: [
		self renderLabel: aProcess name on: html.
		self renderValue: aProcess priority on: html.
		self renderValue: aProcess printString on: html.
		self
			renderValue: [ self renderTerminate: aProcess on: html ]
			on: html.
		self
			renderValue: [ self renderSignalSemaphore: aProcess on: html ]
			on: html.
		self
			renderValue: [ self renderInspect: aProcess on: html ]
			on: html ]