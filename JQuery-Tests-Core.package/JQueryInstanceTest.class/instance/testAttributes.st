tests-attributes
testAttributes
	self 
		assert: ((self jQuery: 'img') attributes: (GRSmallDictionary new
				at: 'src'
					put: '/images/hat.gif';
				at: 'title'
					put: 'jQuery';
				at: 'alt'
					put: 'jQuery Logo';
				yourself))
		equals: self function , '("img").attr({"src":"/images/hat.gif","title":"jQuery","alt":"jQuery Logo"})'