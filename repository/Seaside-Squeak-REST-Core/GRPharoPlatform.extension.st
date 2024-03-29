Extension { #name : 'GRPharoPlatform' }

{ #category : '*seaside-squeak-rest-core' }
GRPharoPlatform >> argumentNamesOf: aCompiledMethod [
	^ aCompiledMethod methodNode arguments collect: [ :each | each key ]
]
