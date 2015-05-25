actions
openHandler: aHandler
	aHandler isNil ifTrue: [ ^ self ].
	self dispatcher: (aHandler isDispatcher
		ifFalse: [ aHandler parent ]
		ifTrue: [ aHandler ])