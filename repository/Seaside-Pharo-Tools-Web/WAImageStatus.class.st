"
A WAImageStatus displays information about the current Smalltalk image.
"
Class {
	#name : #WAImageStatus,
	#superclass : #WAPharoStatusItem,
	#category : 'Seaside-Pharo-Tools-Web'
}

{ #category : #actions }
WAImageStatus >> clear [
	WAAdmin clearSessions.
	Smalltalk garbageCollect
]

{ #category : #accessing }
WAImageStatus >> label [
	^ 'Image'
]

{ #category : #accessing }
WAImageStatus >> priority [
	^ 100
]

{ #category : #rendering }
WAImageStatus >> renderContentOn: html [
	super renderContentOn: html.
	
	html heading level2; with: 'Actions'.
	
	html unorderedList: [
		html listItem: [
			html anchor
				callback: [ self image snapshot: true andQuit: false ];
				with: 'Save' ].
		html listItem: [
			html anchor
				callback: [ self image snapshot: true andQuit: true ];
				with: 'Save and Quit' ].
		html listItem: [
			html anchor
				callback: [ self image snapshot: false andQuit: true ];
				with: 'Quit Without Saving' ] ]
]

{ #category : #rendering }
WAImageStatus >> renderValuesOn: html [
	| upTime |
	upTime := Duration milliseconds: Time millisecondClockValue.
	
	self renderLabel: 'Uptime' value: (self printDuration: upTime) on: html.
	self renderLabel: 'Version' value: Smalltalk version on: html.
	self renderLabel: 'Image Path' value: (self image vm getSystemAttribute: 1) on: html.
	self
		renderLabel: 'Number of Sessions'
		value: [
			html text:self numberOfSessions.
			html space.
			html anchor
				callback: [ self clear. self requestContext redirectTo: self application url ];
				title: 'Expires all sessions and does a full garbage collect.';
				with: 'Clear' ]
		on: html.
	self renderLabel: 'Number of Classes' value: Smalltalk allClasses size on: html
]

{ #category : #accessing }
WAImageStatus >> title [
	^ 'Smalltalk Image'
]

{ #category : #accessing }
WAImageStatus >> upTime [
	^ WAUpTimeTracker imageUpTime
]
