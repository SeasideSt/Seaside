tests
testAsSelector
	self assert: (WAFileLibrary asSelector: 'main.css') = #mainCss.
	self assert: (WAFileLibrary asSelector: 'main.js') = #mainJs.
	self assert: (WAFileLibrary asSelector: 'style-2.css') = #style2Css.
	self assert: (WAFileLibrary asSelector: 'style_2.css') = #style2Css.
	
	"https://code.google.com/p/seaside/issues/detail?id=786"
	self assert: (WAFileLibrary asSelector: 'main') = #main.
	self assert: (WAFileLibrary asSelector: 'main.') = #main.
	self assert: (WAFileLibrary asSelector: ').find(') isNil.
	self assert: (WAFileLibrary asSelector: '),10)') isNil