Class {
	#name : #WAExpiryFunctionalTest,
	#superclass : #WAFunctionalTest,
	#category : 'Seaside-Tests-Functional'
}

{ #category : #rendering }
WAExpiryFunctionalTest >> redirect [
	"we need to build the url we redirect to because we just expired the session in this test"
	| url |
	url := self application url.
	url addAllToPath: self requestContext consumer upToEnd.
	^ self requestContext responseGenerator
		redirectTo: url;
		respond
]

{ #category : #rendering }
WAExpiryFunctionalTest >> renderActionsOn: html [
	html
		paragraph: [ 
			html anchor
				url: (self application url with: self class name);
				with: 'New Session'.
			html break.
			html anchor
				callback: [ self session unregister. self redirect ];
				with: 'Expire'.
			html break.
			html anchor
				callback: [ WAExpirySession resetCounters ];
				with: 'Reset Counters'.
			html break.
			html anchor
				callback: [ GRPlatform current seasideGarbageCollect ];
				with: 'Garbage Collect'.
			html break.
			html anchor
				callback: [ 
					self application clear.
					GRPlatform current seasideGarbageCollect.
					self redirect ];
				with: 'Clear Cache'.
			html break.
			html anchor
				callback: [ 
					self application clear.
					WAExpirySession resetCounters.
					GRPlatform current seasideGarbageCollect.
					self redirect ];
				with: 'Reset All' ]
]

{ #category : #rendering }
WAExpiryFunctionalTest >> renderContentOn: html [
	self renderStatsOn: html.
	self renderActionsOn: html
]

{ #category : #rendering }
WAExpiryFunctionalTest >> renderStatsOn: html [
	html table: [
		html tableRow: [
			html tableHeading: 'Total session instances'.
			html tableData: WAExpirySession allInstances size ].
		html tableRow: [
			html tableHeading: 'Cached session instances for this Application'.
			html tableData: self application cache size ].
		html tableRow: [
			html tableHeading: 'Total component instances'.
			html tableData: self class allInstances size ].
		html tableRow: [
			html tableHeading: 'Sessions created'.
			html tableData: WAExpirySession created ].
		html tableRow: [
			html tableHeading: 'Sessions unregistered'.
			html tableData: WAExpirySession unregistered ] ]
]
