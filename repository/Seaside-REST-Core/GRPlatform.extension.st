Extension { #name : #GRPlatform }

{ #category : #'*seaside-rest-core' }
GRPlatform >> argumentNamesOf: aCompiledMethod [
	"Answer the argument names of a method as a sequenceable collection of strings. The default implementation does not support this call."

	^ #()
]

{ #category : #'*seaside-rest-core' }
GRPlatform >> createRoutesFor: aClass [
	^ WARouteBuilder createRoutesFor: aClass
]

{ #category : #'*seaside-rest-core' }
GRPlatform >> createRoutesFrom: aClass to: aSuperClass [
	^ WARouteBuilder createRoutesFrom: aClass to: aSuperClass
]
