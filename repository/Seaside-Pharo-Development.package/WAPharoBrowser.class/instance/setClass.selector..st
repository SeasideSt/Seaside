accessing
setClass: aClass selector: aSelector
	| method protocol |
	method := aClass methodDict at: aSelector ifAbsent: [ nil ].
	protocol := method ifNil: [ nil ] ifNotNil: [ method protocol ].
	selectedPackage := self parentOfClass: aClass.
	selectedClass := aClass.
	showInstance := aClass isMeta not.
	selectedMessageCategory := protocol.
	selectedMethod := method