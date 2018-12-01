Extension { #name : #WARenderer }

{ #category : #'*jquery-core' }
WARenderer >> jQuery [
	^ (JQueryClass context: self context)
		rendererClass: self species;
		yourself
]

{ #category : #'*jquery-core' }
WARenderer >> jQuery: anObject [
	^ self jQuery with: anObject
]
