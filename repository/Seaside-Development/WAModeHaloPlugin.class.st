"
I control the rendering modes of the halo.
"
Class {
	#name : #WAModeHaloPlugin,
	#superclass : #WAHaloPlugin,
	#category : 'Seaside-Development-Plugins'
}

{ #category : #accessing }
WAModeHaloPlugin >> priority [
	^ 900
]

{ #category : #rendering }
WAModeHaloPlugin >> renderContentOn: html [
	html div class: self cssClass; with: [
		self requestor modes
			do: [ :each |
				html anchor
					class: 'active' if: self requestor mode = each;
					callback: [ self requestor mode: each ];
					with: (self labelForSelector: each) ]
			separatedBy: [ html text: ' / ' ] ]
]
