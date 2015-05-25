tests-attributes
testCoreAttributesTitle
	self
		assert: [ :html | html div title: 'Seaside' ]
		gives: '<div title="Seaside"></div>'