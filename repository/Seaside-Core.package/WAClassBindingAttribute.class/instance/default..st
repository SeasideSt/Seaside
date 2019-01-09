accessing
default: aClass
	default := aClass isNil
		ifTrue: [ nil ]
		ifFalse: [ GRPlatform current bindingOf: aClass ]