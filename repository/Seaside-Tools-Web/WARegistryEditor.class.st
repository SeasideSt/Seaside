Class {
	#name : #WARegistryEditor,
	#superclass : #WAHandlerEditor,
	#instVars : [
		'cacheEditor'
	],
	#category : 'Seaside-Tools-Web'
}

{ #category : #hooks }
WARegistryEditor >> children [
	^ super children copyWith: cacheEditor
]

{ #category : #initialization }
WARegistryEditor >> initializeOn: aHandler [
	| cache |
	super initializeOn: aHandler.
	cache := self handler cache.
	cacheEditor := cache editorClass new
		configuration: cache;
		handler: handler;
		group: #cache;
		parent: self;
		yourself
]

{ #category : #rendering }
WARegistryEditor >> renderSubItemsOn: html [
	super renderSubItemsOn: html.
	html render: cacheEditor
]
