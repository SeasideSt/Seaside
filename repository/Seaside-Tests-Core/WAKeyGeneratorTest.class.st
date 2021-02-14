Class {
	#name : #WAKeyGeneratorTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Core-Utilities'
}

{ #category : #accessing }
WAKeyGeneratorTest >> count [
	^ 512
]

{ #category : #tests }
WAKeyGeneratorTest >> testUnique [
	| collection id |
	collection := Set new: self count.
	self count timesRepeat: [
		id := WAKeyGenerator current keyOfLength: 48.
		self
			deny: (collection includes: id)
			description: 'This is extremely unlikely to fail, if it does repeatedly then there is something wrong with the random generator.'.
		collection add: id ]
]
