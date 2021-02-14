Class {
	#name : #WAMetaElementTest,
	#superclass : #WAAbstractHtmlElementTest,
	#category : 'Seaside-Tests-Core-Document'
}

{ #category : #tests }
WAMetaElementTest >> testLeftToRight [
	self
		assert: [ :root | root meta beLeftToRight ]
		gives: '<meta dir="LTR"/>'
]
