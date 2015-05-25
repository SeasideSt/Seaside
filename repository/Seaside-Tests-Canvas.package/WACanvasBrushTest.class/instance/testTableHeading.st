tests-tags-tables
testTableHeading
	self
		assert: [ :html | html tableHeading ]
		gives: '<th></th>'.
	self
		assert: [ :html | html tableHeading character: '.'; characterOffset: 2 ]
		gives: '<th char="." charoff="2"></th>'.
	self
		assert: [ :html | html tableHeading align: 'right'; verticalAlign: 'top' ]
		gives: '<th align="right" valign="top"></th>'.
	self
		assert: [ :html | html tableHeading abbreviation: 'short'; with: 'longer' ]
		gives: '<th abbr="short">longer</th>'.
	self
		assert: [ :html | html tableHeading axis: 'time' ]
		gives: '<th axis="time"></th>'.
	self
		assert: [ :html | html tableHeading colSpan: 2; rowSpan: 3 ]
		gives: '<th colspan="2" rowspan="3"></th>'.
	self
		assert: [ :html | html tableHeading headers: 'zork' ]
		gives: '<th headers="zork"></th>'.
	self
		assert: [ :html | html tableHeading scope: 'colgroup' ]
		gives: '<th scope="colgroup"></th>'