rendering
renderMaximumRelativeAgeOn: html
	html tableRow: [
		html tableHeading: [
			html label: 'Maximum Relative Age' ].
		html tableData: [ 
			html textInput
			size: 5;
			on: #maximumRelativeAge of: self ] ].
	
	html tableRow: [
		html tableData
			colSpan: 2;
			with: 'After so many seconds of inactivity a session is considered expired. 0 for no limit. Has to be positive.' ]