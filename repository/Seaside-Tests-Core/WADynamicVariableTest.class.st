Class {
	#name : #WADynamicVariableTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Core-Utilities'
}

{ #category : #tests }
WADynamicVariableTest >> testAnswer [
	self assert: (WADynamicVariable use: 'value' during: [ true ])
]

{ #category : #tests }
WADynamicVariableTest >> testWithNestedValue [
	WADynamicVariable 
		use: 'outer' 
		during: [
			WADynamicVariable 
				use: 'inner'
				during: [ self assert: WADynamicVariable value = 'inner' ].
			self assert: WADynamicVariable value = 'outer' ]
]

{ #category : #tests }
WADynamicVariableTest >> testWithValue [
	WADynamicVariable 
		use: 'value' 
		during: [ self assert: WADynamicVariable value = 'value' ]
]

{ #category : #tests }
WADynamicVariableTest >> testWithoutValue [
	self assert: WADynamicVariable value isNil
]
