Class {
	#name : #WAFileHandlerEditor,
	#superclass : #WAHandlerEditor,
	#instVars : [
		'fileEditor'
	],
	#category : 'Seaside-Tools-Web'
}

{ #category : #hooks }
WAFileHandlerEditor >> children [
	^ super children copyWith: fileEditor
]

{ #category : #initialization }
WAFileHandlerEditor >> initializeOn: aHandler [
	super initializeOn: aHandler.
	fileEditor := WAFileAttributeEditor new
		configuration: self handler libraries;
		handler: handler;
		group: #libraries;
		parent: self;
		yourself
]

{ #category : #rendering }
WAFileHandlerEditor >> renderSubItemsOn: html [
	super renderSubItemsOn: html.
	html render: fileEditor
]
