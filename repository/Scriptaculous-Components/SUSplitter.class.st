Class {
	#name : #SUSplitter,
	#superclass : #WAComponent,
	#instVars : [
		'items'
	],
	#category : 'Scriptaculous-Components-Core'
}

{ #category : #public }
SUSplitter >> add: anObject [
	^ items add: (SUSplitterItem on: self body: anObject)
]

{ #category : #public }
SUSplitter >> add: anObject size: aString [
	^ (self add: anObject) size: aString
]

{ #category : #public }
SUSplitter >> add: anObject size: aString min: anInteger [
	^ (self add: anObject) size: aString; min: anInteger
]

{ #category : #hooks }
SUSplitter >> children [
	^ (items select: [ :each | each isComponent ]) collect: [ :each | each body ]
]

{ #category : #accessing }
SUSplitter >> cssClass [
	^ self subclassResponsibility
]

{ #category : #scripts }
SUSplitter >> draggable: aBeforeItem and: anAfterItem on: html [
	^ html scriptaculous draggable
		revert: true;
		endEffect: nil;
		startEffect: nil;
		onStart: ((JSStream on: 'var splitter = drag.element;',
								self initOffsetScript ,'
								drag._previous = splitter.previous();
								drag._next = splitter.next();')
			asFunction: #(drag))
]

{ #category : #scripts }
SUSplitter >> initOffsetScript [
	^ self subclassResponsibility
]

{ #category : #initialization }
SUSplitter >> initialize [
	super initialize.
	items := OrderedCollection new
]

{ #category : #accessing }
SUSplitter >> items [
	^ items
]

{ #category : #rendering }
SUSplitter >> renderContentOn: html [
	html div class: self cssClass; with: [
		1 to: self items size do: [ :index |
			self renderItem: (self items at: index) on: html.
			self items size = index ifFalse: [ 
				self
					renderSplitter: (self items at: index) 
					and: (self items at: index + 1) 
					on: html ] ] ]
]

{ #category : #rendering }
SUSplitter >> renderItem: anItem on: html [
	self subclassResponsibility
]

{ #category : #rendering }
SUSplitter >> renderSplitter: aBeforeItem and: anAfterItem on: html [
	html div 
		class: 'handle'; 
		script: (self 
			draggable: aBeforeItem 
			and: anAfterItem
			on: html)
]
