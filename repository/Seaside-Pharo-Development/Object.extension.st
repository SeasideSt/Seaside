Extension { #name : #Object }

{ #category : #'*seaside-pharo-development-core' }
Object >> inspectorFields [
	| members |
	members := WriteStream on: Array new.
	self class allInstVarNames 
		keysAndValuesDo: [ :index :each | members nextPut: each -> (self instVarAt: index) ].
	self class isVariable
		ifTrue: [ 1 to: self basicSize do: [ :index | members nextPut: index -> (self basicAt: index) ] ].
	^ members contents
]

{ #category : #'*seaside-pharo-development-core' }
Object >> traversableIndexableVarIndexes [
	^ 1 to: self basicSize
]

{ #category : #'*seaside-pharo-development-core' }
Object >> traversableInstVarIndexes [
	^ 1 to: self class instSize
]

{ #category : #'*seaside-pharo-development-core' }
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
