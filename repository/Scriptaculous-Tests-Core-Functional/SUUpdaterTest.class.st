Class {
	#name : #SUUpdaterTest,
	#superclass : #SUFunctionalTest,
	#category : 'Scriptaculous-Tests-Core-Functional'
}

{ #category : #accessing }
SUUpdaterTest >> insertionsFromFactory: aFactory [
	^ Array
		with: aFactory insertion before
		with: aFactory insertion top
		with: aFactory insertion bottom
		with: aFactory insertion after
]

{ #category : #rendering }
SUUpdaterTest >> renderContentOn: html [
	| elementId |
	elementId := html nextId.
	html paragraph: [
		(self insertionsFromFactory: html prototype) do: [ :each |
			html anchor
				onClick: (html scriptaculous updater
					id: elementId;
					insertion: each;
					on: #renderElementOn: of: self);
				with: each.
			html break ] ].
	html div: [ html div class: 'targetElement'; id: elementId; with: 'Target Element' ]
]

{ #category : #rendering }
SUUpdaterTest >> renderElementOn: html [
	html div: Time now
]

{ #category : #hooks }
SUUpdaterTest >> style [
	^ 'div.targetElement { background-color: #fff4d8; }'
]
