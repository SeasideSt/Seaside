Class {
	#name : #JQTabsFunctionalTest,
	#superclass : #JQUiFunctionalTest,
	#instVars : [
		'selectedTab'
	],
	#category : 'JQuery-Tests-UI-Functional'
}

{ #category : #initialization }
JQTabsFunctionalTest >> initialize [
	super initialize.
	selectedTab := 0
]

{ #category : #rendering }
JQTabsFunctionalTest >> renderContentOn: html [
	html div
		script: (html jQuery new tabs
			active: selectedTab;
			onBeforeActivate: (html jQuery ajax 
				callbackTabs: [ :event | selectedTab:= event at: #index ]));
		with: [
			html unorderedList: [
				self berries keysAndValuesDo: [ :name :description |
					html listItem: [
						html anchor
							url: (html jQuery ajax
								html: [ :h | h text: description ];
								fullUrl);
							with: name ] ] ] ]

]

{ #category : #accessing }
JQTabsFunctionalTest >> selectors [
	^ #(renderContentOn:)
]

{ #category : #accessing }
JQTabsFunctionalTest >> title [
	^ 'Tabs Widget'
]

{ #category : #accessing }
JQTabsFunctionalTest >> url [
	^ 'http://docs.jquery.com/UI/Tabs'
]
