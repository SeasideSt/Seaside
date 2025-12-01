Class {
	#name : 'WACanvasTestDecoration',
	#superclass : 'WADecoration',
	#instVars : [
		'tagName'
	],
	#category : 'Seaside-Tests-RenderLoop',
	#package : 'Seaside-Tests-RenderLoop'
}

{ #category : 'rendering' }
WACanvasTestDecoration class >> rendererClass [
	"Make sure we use WAHtmlCanvas even if a different renderer is default."

	^ WAHtmlCanvas
]

{ #category : 'accessing' }
WACanvasTestDecoration class >> tagName: aString [

	^self new 
		tagName: aString;
		yourself
]

{ #category : 'initialization' }
WACanvasTestDecoration >> initialize [ 

	super initialize.
	tagName := 'div'
]

{ #category : 'accessing' }
WACanvasTestDecoration >> renderContentOn: html [
	(html tag: self tagName) with: [ self renderNextOn: html ]
]

{ #category : 'accessing' }
WACanvasTestDecoration >> tagName [
	^ tagName
]

{ #category : 'accessing' }
WACanvasTestDecoration >> tagName: anObject [
	tagName := anObject
]
