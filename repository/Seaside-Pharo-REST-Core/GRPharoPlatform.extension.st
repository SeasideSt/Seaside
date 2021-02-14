Extension { #name : #GRPharoPlatform }

{ #category : #'*seaside-pharo-rest-core' }
GRPharoPlatform >> argumentNamesOf: aCompiledMethod [
	^ aCompiledMethod methodNode arguments collect: [ :each | each key ]
]
