tests-parsetree
testFixCallbackTempsMissing
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	self
		compile: 'callbackTemps | r | r := OrderedCollection new. (1 to: 10) do: [ :e | r add: [ e ] ]' 
		in: class.
	self 
		runRule: WAFixCallbackTempsMissingRule
		selectors: #(callbackTemps)