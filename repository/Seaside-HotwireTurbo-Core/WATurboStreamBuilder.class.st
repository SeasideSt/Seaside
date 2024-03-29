Class {
	#name : 'WATurboStreamBuilder',
	#superclass : 'WAObject',
	#instVars : [
		'canvas'
	],
	#category : 'Seaside-HotwireTurbo-Core',
	#package : 'Seaside-HotwireTurbo-Core'
}

{ #category : 'instance creation' }
WATurboStreamBuilder class >> newWithRenderContext: aRenderContext [

	^ self new initializeWithContext: aRenderContext; yourself
]

{ #category : 'actions' }
WATurboStreamBuilder >> after: anId with: aRenderable [

	self turboStreamAction: 'after' target: anId with: aRenderable
]

{ #category : 'actions' }
WATurboStreamBuilder >> append: anId with: aRenderable [

	self turboStreamAction: 'append' target: anId with: aRenderable
]

{ #category : 'actions' }
WATurboStreamBuilder >> before: anId with: aRenderable [

	self turboStreamAction: 'before' target: anId with: aRenderable
]

{ #category : 'initialize' }
WATurboStreamBuilder >> initializeWithContext: aRenderContext [

	canvas := WAHtmlCanvas context: aRenderContext
]

{ #category : 'actions' }
WATurboStreamBuilder >> prepend: anId with: aRenderable [

	self turboStreamAction: 'prepend' target: anId with: aRenderable
]

{ #category : 'actions' }
WATurboStreamBuilder >> remove: anId [

	self turboStreamAction: 'remove' target: anId with: nil
]

{ #category : 'convenience' }
WATurboStreamBuilder >> removeComponent: aComponent [

	self remove: aComponent turboframeDecoration id
]

{ #category : 'actions' }
WATurboStreamBuilder >> replace: anId with: aRenderable [

	self turboStreamAction: 'replace' target: anId with: aRenderable
]

{ #category : 'private' }
WATurboStreamBuilder >> turboStreamAction: aName target: anId with: aRenderable [

	(canvas tag: 'turbo-stream')
		attributeAt: 'action' put: aName;
		attributeAt: 'target' put: anId;
		with: [ 
			aRenderable ifNotNil:[ 
				(canvas tag: 'template')
					with:[ aRenderable renderOn: canvas ] ] ]
]

{ #category : 'actions' }
WATurboStreamBuilder >> update: anId with: aRenderable [

	self turboStreamAction: 'update' target: anId with: aRenderable
]
