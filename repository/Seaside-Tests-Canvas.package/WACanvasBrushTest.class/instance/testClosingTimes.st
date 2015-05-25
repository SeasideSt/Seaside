tests
testClosingTimes
	self assert: [ :html | html div; div ] gives: '<div></div><div></div>'.
	self assert: [ :html | html break; div ] gives: '<br/><div></div>'.
	self assert: [ :html | html div; break ] gives: '<div></div><br/>'.
	self assert: [ :html | html break; break ] gives: '<br/><br/>'.

	self assert: [ :html | html div: [ html div ]; div ] gives: '<div><div></div></div><div></div>'.
	self assert: [ :html | html div: [ html break ]; div ] gives: '<div><br/></div><div></div>'.
	self assert: [ :html | html div: [ html div ]; break ] gives: '<div><div></div></div><br/>'.
	self assert: [ :html | html div: [ html break ]; break ] gives: '<div><br/></div><br/>'