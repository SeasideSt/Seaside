tests-tags-tables
testTableColumn
	self
		assert: [ :html | html tableColumn ]
		gives: '<col/>'.
	self
		assert: [ :html | html tableColumn character: '.'; characterOffset: 2 ]
		gives: '<col char="." charoff="2"/>'.
	self
		assert: [ :html | html tableColumn align: 'right'; verticalAlign: 'top' ]
		gives: '<col align="right" valign="top"/>'.
	self
		assert: [ :html | html tableColumn span: 3; width: '20' ]
		gives: '<col span="3" width="20"/>'