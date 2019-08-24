tests-tags-anchors
testAnchorCallback
	self
		assert: [ :html | html anchor callback: [ ] ]
		gives: '<a href="/?1"></a>'.
		
	self
		assert: [ :html | 
			self 
				should: [ html anchor callback: [ :value | ] ]
				raise: Error ]
		gives: '<a></a>'