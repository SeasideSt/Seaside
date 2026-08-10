tests-events
testUndelegate
	self
		assert: ((self jQuery: '#theone') undelegate)
		equals: self function , '("#theone").off()'.
	self
		assert: ((self jQuery: '#theone') undelegate: 'tr' on: 'click')
		equals: self function , '("#theone").off("click","tr")'