tests-modifying
testWrap
	self
		assert: ((self jQuery: 'p') wrap: [ :html | html strong ])
		equals: self function , '("p").wrap("<strong><\/strong>")'.
	self
		assert: ((self jQuery: 'p') wrapAll: [ :html | html div ])
		equals: self function , '("p").wrapAll("<div><\/div>")'.
	self
		assert: ((self jQuery: 'p') wrapInner: [ :html | html span ])
		equals: self function , '("p").wrapInner("<span><\/span>")'