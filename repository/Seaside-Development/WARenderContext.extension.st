Extension { #name : #WARenderContext }

{ #category : #'*seaside-development' }
WARenderContext >> addHaloVisitor: aHaloVisitor [
	visitor := visitor addHaloVisitor: aHaloVisitor
]

{ #category : #'*seaside-development' }
WARenderContext >> disableHalos [
	self properties at: #halosEnabled put: false
]

{ #category : #'*seaside-development' }
WARenderContext >> enableHalos [
	self properties at: #halosEnabled put: true
]

{ #category : #'*seaside-development' }
WARenderContext >> halosEnabled [
	^ self properties at: #halosEnabled ifAbsent: [ false ]
]
