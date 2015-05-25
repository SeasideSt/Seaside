tests-tags-tables
testTable
	self
		assert: [ :html | html table ]
		gives: '<table></table>'.
	self
		assert: [ :html | html table cellpadding: 0; cellspacing: 1 ]
		gives: '<table cellpadding="0" cellspacing="1"></table>'.
	self
		assert: [ :html | html table frame: 'box'; rules: 'groups' ]
		gives: '<table frame="box" rules="groups"></table>'.
	self
		assert: [ :html | html table summary: 'a short summary' ]
		gives: '<table summary="a short summary"></table>'