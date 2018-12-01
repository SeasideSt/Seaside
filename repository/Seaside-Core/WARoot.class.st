"
A WARoot is the root of a document. It is responsible to generate header and footer of a document.
"
Class {
	#name : #WARoot,
	#superclass : #WAObject,
	#instVars : [
		'context'
	],
	#category : 'Seaside-Core-Document'
}

{ #category : #'instance creation' }
WARoot class >> context: aRenderContext [
	^ self new setContext: aRenderContext
]

{ #category : #accessing }
WARoot >> absoluteUrlForResource: aString [
	^ self context absoluteUrlForResource: aString
]

{ #category : #writing }
WARoot >> closeOn: aDocument [
	"Close aDocument and optionally write its footer."
]

{ #category : #accessing }
WARoot >> context [
	^ context
]

{ #category : #writing }
WARoot >> openOn: aDocument [
	"Open aDocument and optionally write its header."
]

{ #category : #initialization }
WARoot >> setContext: aRenderContext [
	context := aRenderContext
]
