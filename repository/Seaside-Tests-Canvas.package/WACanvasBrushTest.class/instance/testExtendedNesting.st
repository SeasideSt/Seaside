tests
testExtendedNesting
	self assert: [ :html | html div: nil ] gives: '<div></div>'.
	self assert: [ :html | html div: #( 1 $a ) ] gives: '<div>1a</div>'.
	self assert: [ :html | html div: [ html span ] ] gives: '<div><span></span></div>'