Class {
	#name : #WAFunctionalTaskTest,
	#superclass : #WATask,
	#category : 'Seaside-Tests-Functional'
}

{ #category : #testing }
WAFunctionalTaskTest class >> isFunctionalTest [
	^ self name ~= #WAFunctionalTaskTest
]
