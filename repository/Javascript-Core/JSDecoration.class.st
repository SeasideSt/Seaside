"
I decorate JavaScript objects.
"
Class {
	#name : 'JSDecoration',
	#superclass : 'WAObject',
	#instVars : [
		'owner'
	],
	#category : 'Javascript-Core-Decorations',
	#package : 'Javascript-Core',
	#tag : 'Decorations'
}

{ #category : 'testing' }
JSDecoration >> isJavascript [
	^ true
]

{ #category : 'printing' }
JSDecoration >> javascriptContentOn: aRenderer [
	self owner javascriptContentOn: aRenderer
]

{ #category : 'accessing' }
JSDecoration >> owner [
	^ owner
]

{ #category : 'accessing' }
JSDecoration >> renderContext [
	^ owner renderContext
]

{ #category : 'initialization' }
JSDecoration >> setOwner: anObject [
	owner := anObject
]
