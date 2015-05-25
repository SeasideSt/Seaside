tests
testPreferenceAt
	handler configuration addParent:
		(WAConfigurationMock new
			description: [ :config | (config string: #foo) default: #bar ];
			yourself).
	self assert: (handler preferenceAt: #foo) = #bar.
	handler preferenceAt: #foo put: #baz.
	self assert: (handler preferenceAt: #foo) = #baz.
	handler preferenceAt: #foo put: nil.
	self deny: (handler configuration hasExpressionAt: #foo).
	self should: [ handler preferenceAt: #missing ] raise: WAAttributeNotFound