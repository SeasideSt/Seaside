Class {
	#name : #WAClassBindingAttribute,
	#superclass : #WAListAttribute,
	#category : 'Seaside-Core-Configuration'
}

{ #category : #visiting }
WAClassBindingAttribute >> accept: aVisitor [
	aVisitor visitClassBindingAttribute: self
]

{ #category : #accessing }
WAClassBindingAttribute >> default: aClass [
	default := aClass isNil
		ifTrue: [ nil ]
		ifFalse: [ GRPlatform current bindingOf: aClass ]
]

{ #category : #converting }
WAClassBindingAttribute >> stringForValue: aBinding [ 
	^ aBinding isNil ifFalse: [ aBinding value name greaseString ]
]
