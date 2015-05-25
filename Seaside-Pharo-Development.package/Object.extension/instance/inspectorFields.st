*seaside-pharo-development-core
inspectorFields
	| members |
	members := WriteStream on: Array new.
	self class allInstVarNames 
		keysAndValuesDo: [ :index :each | members nextPut: each -> (self instVarAt: index) ].
	self class isVariable
		ifTrue: [ 1 to: self basicSize do: [ :index | members nextPut: index -> (self basicAt: index) ] ].
	^ members contents