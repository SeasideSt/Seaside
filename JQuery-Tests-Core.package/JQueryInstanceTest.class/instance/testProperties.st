tests-attributes
testProperties
	self 
		assert: ((self jQuery: 'img') properties: (GRSmallDictionary new
				at: 'src'
					put: '/images/hat.gif';
				at: 'title'
					put: 'jQuery';
				at: 'alt'
					put: 'jQuery Logo';
				yourself))
		equals: self function , '("img").prop({"src":"/images/hat.gif","title":"jQuery","alt":"jQuery Logo"})'