rendering
renderEntityTableFootOn: html
	html tableFoot: [
		html tableRow: [
			html tableData colSpan: 7;
				class: 'wacanvastabletest-aligncenter';
				with: '5 entities shown' ] ]