Class {
	#name : #SUTabPanel,
	#superclass : #SUNavigation,
	#instVars : [
		'selected'
	],
	#category : 'Scriptaculous-Components-Core'
}

{ #category : #accessing }
SUTabPanel >> cssClass [
	^ 'tabPanel'
]

{ #category : #rendering }
SUTabPanel >> renderNavigationOn: html [
	html div
		class: self cssClass;
		with: [
			self renderTabsOn: html.
			self renderPanelOn: html ]
]

{ #category : #rendering }
SUTabPanel >> renderPanelOn: html [
	html div
		id: (self uid: 'body' at: 0);
		class: 'body';
		with: self selected
]

{ #category : #rendering }
SUTabPanel >> renderTabsOn: html [ 
	| active |
	html unorderedList
		class: 'head';
		with: [
			items keysAndValuesDo: [ :index :element | 
				active := self selected = element.
				html listItem: [
					html anchor
						id: (self uid: 'head' at: index);
						class: 'active' if: active;
						onClick: (html prototype evaluator
							callback: [ :script | self scriptSelected: element on: script ];
							return: false);
						callback: [ self selected: element ];
						with: element label ] ] ]
]

{ #category : #scripting }
SUTabPanel >> scriptSelected: aComponent on: aScript [
	aScript prototype element
		id: (self uid: 'head' at: (self
			findIndex: self selected
			ifAbsent: [ ]));
		removeClassName: 'active'.
	self selected: aComponent.
	aScript prototype element
		id: (self uid: 'head' at: (self
			findIndex: self selected
			ifAbsent: [ ^ self ]));
		addClassName: 'active'.
	aScript prototype element
		id: (self uid: 'body' at: 0);
		update: self selected
]

{ #category : #accessing }
SUTabPanel >> selected [
	^ selected ifNil: [ selected := items isEmpty ifFalse: [ items first ] ]
]

{ #category : #accessing }
SUTabPanel >> selected: anElement [
	selected := anElement
]

{ #category : #accessing }
SUTabPanel >> visible [
	selected ifNil: [ ^ #() ].
	^ Array with: selected
]
