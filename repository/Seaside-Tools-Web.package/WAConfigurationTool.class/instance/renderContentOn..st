rendering
renderContentOn: html
	html table
		class: 'wa-config';
		cellpadding: 0;
		cellspacing: 0;
		with: [
			html tableRow: [
				html tableData
					style: 'width: 100%';
					with: [ self renderHeadingOn: html ].
				html tableData rowSpan: 2; with: [ self renderLogoOn: html ] ].
			html tableRow: [
				html tableData: [ self renderTopBarOn: html ] ] ].
	html div: [ self renderComponentOn: html ]