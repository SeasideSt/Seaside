tests-block
testDoNotCombineMultiplePrimaryAjaxCallbacks
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	self compile: 'scriptOn: html html jQuery ajax callback:[ 1 ]; callback:[ 2 ]' in: class.
	self compile: 'scriptOn2: s s jQuery ajax callback:[ 1 ]; callback:[ 2 ]' in: class.
	self compile: 'scriptOn3: s s jQuery ajax callback:[ 1 ]; script:[ 2 ]' in: class.
	self compile: 'scriptOn4: s s jQuery ajax script: [ 1 ]; callback:[ 2 ]' in: class.
	self compile: 'scriptOn5: s s jQuery ajax script: [ 1 ]; callback:[ 2 ] value: 3' in: class.
	self compile: 'scriptOn6: s s jQuery ajax script: [ 1 ]; callback:[ 2 ] passengers: 3' in: class.
	self compile: 'scriptOn7: s s jQuery ajax callback:[ 2 ] passengers: 3; script: [ 1 ] ' in: class.
	self compile: 'scriptOn8: s s jQuery ajax callback:[ 2 ] value: 3; script: [ 1 ]' in: class.
	self 
		runRule: WADoNotCombineMultiplePrimaryAjaxCallbacks
		selectors: #(scriptOn: scriptOn2: scriptOn3: scriptOn4:)