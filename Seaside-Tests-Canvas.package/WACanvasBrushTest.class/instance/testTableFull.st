tests-tags-tables
testTableFull
	self
		assert: [ :html | 
			html table: [
				html tableCaption: 'title'.
				html tableColumnGroup: [
					html tableColumn.
					html tableColumn ].
				html tableHead: [
					html tableRow: [ 
						html tableHeading: 'a1'.
						html tableHeading: 'a2' ] ].
				html tableFoot: [
					html tableRow: [ 
						html tableData: 'b1'.
						html tableData: 'b2' ] ].
				html tableBody: [
					html tableRow: [ 
						html tableData: 'c1'.
						html tableData: 'c2' ].
					html tableRow: [ 
						html tableData: 'd1'.
						html tableData: 'd2' ] ] ] ]
		gives: '<table><caption>title</caption><colgroup><col/><col/></colgroup><thead><tr><th>a1</th><th>a2</th></tr></thead><tfoot><tr><td>b1</td><td>b2</td></tr></tfoot><tbody><tr><td>c1</td><td>c2</td></tr><tr><td>d1</td><td>d2</td></tr></tbody></table>'