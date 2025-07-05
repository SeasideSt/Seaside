basic tests
testTable

	self
		assertMicroDown: 
'| aaa | bbb
| ccc | ddd'
		rendersTo: '<table><tr><td>aaa</td><td>bbb</td></tr><tr><td>ccc</td><td>ddd</td></tr></table>'