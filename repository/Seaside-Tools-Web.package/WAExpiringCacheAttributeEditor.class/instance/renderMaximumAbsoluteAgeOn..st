rendering
renderMaximumAbsoluteAgeOn: html
	html tableRow: [
		html tableHeading: [
			html label: 'Maximum Absolute Age' ].
		html tableData: [ 
			html textInput
			size: 5;
			on: #maximumAbsoluteAge of: self ]  ].
	html tableRow: [
		html tableData
			colSpan: 2;
			with: 'After so many seconds after its creation a session is considered expired no matter when it was last accessed. 0 for no limit. Has to be positive.' ]