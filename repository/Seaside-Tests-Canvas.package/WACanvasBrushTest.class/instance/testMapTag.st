tests-tags-anchors
testMapTag
	self
		assert: [ :html | html map callback: [ :point | ]; with: [ html image url: 'seaside.jpg' ] ]
		gives: '<a href="/?1="><img alt="" ismap="ismap" src="seaside.jpg"/></a>'