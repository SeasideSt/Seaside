Extension { #name : #JSScript }

{ #category : #'*jquery-core' }
JSScript >> jQuery [
	^ (JQueryClass context: self renderContext)
		rendererClass: self rendererClass;
		yourself
]

{ #category : #'*jquery-core' }
JSScript >> jQuery: anObject [
	^ self jQuery with: anObject
]
