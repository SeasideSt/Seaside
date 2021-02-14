Extension { #name : #Object }

{ #category : #'*Seaside-Pharo-Development-core' }
Object >> inspectorFields [
	| members |
	members := WriteStream on: Array new.
	self class allInstVarNames 
		keysAndValuesDo: [ :index :each | members nextPut: each -> (self instVarAt: index) ].
	self class isVariable
		ifTrue: [ 1 to: self basicSize do: [ :index | members nextPut: index -> (self basicAt: index) ] ].
	^ members contents
]

{ #category : #'*Seaside-Pharo-Development' }
Object >> traversableIndexableVarIndexes [
	^ 1 to: self basicSize
]

{ #category : #'*Seaside-Pharo-Development' }
Object >> traversableInstVarIndexes [
	^ 1 to: self class instSize
]

{ #category : #'*Seaside-Pharo-Development' }
Object >> traverseWithMemory: aMemory seen: anIdentitySet [
	aMemory accumulate: self.
	anIdentitySet add: self.
	self traversableInstVarIndexes do: [ :index |
		aMemory 
			traverse: self
			value: (self instVarAt: index)
			seen: anIdentitySet ].
	self traversableIndexableVarIndexes do: [ :index |
		aMemory 
			traverse: self 
			value: (self basicAt: index) 
			seen: anIdentitySet ]
]
