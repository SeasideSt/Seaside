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
WATurboStreamBuilder >> refresh [

	self turboStreamAction: 'refresh' target: nil with: nil
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
WATurboStreamBuilder >> replace: anId morph: morph with: aRenderable [

	self turboStreamAction: 'replace' target: anId morph: morph with: aRenderable
]

{ #category : 'actions' }
WATurboStreamBuilder >> replace: anId with: aRenderable [

	self replace: anId morph: false with: aRenderable
]

{ #category : 'convenience' }
WATurboStreamBuilder >> replaceComponent: aComponent morph: morph with: aRenderable [

	self replace: aComponent turboframeDecoration id morph: morph with: aRenderable
]

{ #category : 'convenience' }
WATurboStreamBuilder >> replaceComponent: aComponent with: aRenderable [

	self replaceComponent: aComponent morph: false with: aRenderable
]

{ #category : 'private' }
WATurboStreamBuilder >> turboStreamAction: aName target: anId morph: morph with: aRenderable [

	(canvas tag: 'turbo-stream')
		attributeAt: 'action' put: aName;
		attributeAt: 'target' put: anId;
		attributeAt: 'method' put: 'morph' if: morph;
		with: [ 
			aRenderable ifNotNil:[ 
				(canvas tag: 'template')
					with:[ aRenderable renderOn: canvas ] ] ]
]

{ #category : 'private' }
WATurboStreamBuilder >> turboStreamAction: aName target: anId with: aRenderable [

	self turboStreamAction: aName target: anId morph: false with: aRenderable
]

{ #category : 'actions' }
WATurboStreamBuilder >> update: anId morph: morph with: aRenderable [

	self turboStreamAction: 'update' target: anId morph: morph with: aRenderable
]

{ #category : 'actions' }
WATurboStreamBuilder >> update: anId with: aRenderable [

	self update: anId morph: false with: aRenderable
]
