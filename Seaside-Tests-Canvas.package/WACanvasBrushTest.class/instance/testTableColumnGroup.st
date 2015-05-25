tests-tags-tables
testTableColumnGroup
	self
		assert: [ :html | html tableColumnGroup ]
		gives: '<colgroup></colgroup>'.
	self
		assert: [ :html | html tableColumnGroup character: '.'; characterOffset: 2 ]
		gives: '<colgroup char="." charoff="2"></colgroup>'.
	self
		assert: [ :html | html tableColumnGroup align: 'right'; verticalAlign: 'top' ]
		gives: '<colgroup align="right" valign="top"></colgroup>'.
	self
		assert: [ :html | html tableColumnGroup span: 3; width: '20' ]
		gives: '<colgroup span="3" width="20"></colgroup>'