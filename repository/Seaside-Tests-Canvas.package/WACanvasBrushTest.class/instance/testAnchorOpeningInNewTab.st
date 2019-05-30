tests-tags-anchors
testAnchorOpeningInNewTab
	self
		assert: [ :html | html anchor callback: [ ]; openInNewTab; with: 'foo' ]
		gives: '<a target="_blank" href="/?1">foo</a>'