Extension { #name : 'Object' }

{ #category : '*Seaside-Pharo-Development-core' }
Object >> inspectorFields [
	| members |
	members := WriteStream on: Array new.
	self class allInstVarNames 
		keysAndValuesDo: [ :index :each | members nextPut: each -> (self instVarAt: index) ].
	self class isVariable
		ifTrue: [ 1 to: self basicSize do: [ :index | members nextPut: index -> (self basicAt: index) ] ].
	^ members contents
]

{ #category : '*Seaside-Pharo-Development' }
Object >> traverseWithMemory: aMemory seen: anIdentitySet [
	| traversableInstVarIndexes traversableIndexableVarIndexes |
	anIdentitySet add: self.
	self isImmediateObject ifTrue: [
		"don't report immediates"
		^ self ].
	aMemory accumulate: self.
	traversableInstVarIndexes := self class instSize.
	1 to: traversableInstVarIndexes do: [ :index |
		aMemory 
			traverse: self
			value: (self instVarAt: index)
			seen: anIdentitySet ].
	traversableIndexableVarIndexes := self basicSize.
	1 to: traversableIndexableVarIndexes do: [ :index |
		aMemory 
			traverse: self 
			value: (self basicAt: index) 
			seen: anIdentitySet ]
]
