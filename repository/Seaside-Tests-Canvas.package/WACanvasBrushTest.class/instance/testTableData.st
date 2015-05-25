tests-tags-tables
testTableData
	self
		assert: [ :html | html tableData ]
		gives: '<td></td>'.
	self
		assert: [ :html | html tableData character: '.'; characterOffset: 2 ]
		gives: '<td char="." charoff="2"></td>'.
	self
		assert: [ :html | html tableData align: 'right'; verticalAlign: 'top' ]
		gives: '<td align="right" valign="top"></td>'.
	self
		assert: [ :html | html tableData abbreviation: 'short'; with: 'longer' ]
		gives: '<td abbr="short">longer</td>'.
	self
		assert: [ :html | html tableData axis: 'time' ]
		gives: '<td axis="time"></td>'.
	self
		assert: [ :html | html tableData colSpan: 2; rowSpan: 3 ]
		gives: '<td colspan="2" rowspan="3"></td>'.
	self
		assert: [ :html | html tableData headers: 'zork' ]
		gives: '<td headers="zork"></td>'.
	self
		assert: [ :html | html tableData scope: 'colgroup' ]
		gives: '<td scope="colgroup"></td>'