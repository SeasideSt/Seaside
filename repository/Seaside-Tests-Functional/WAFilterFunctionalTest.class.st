Class {
	#name : #WAFilterFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'child'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #actions }
WAFilterFunctionalTest >> authentication [
	| filter |
	"We could use #filterWith:during: but that requires Flow."
	filter := WAAuthenticationFilter new
			authenticator: self;
			yourself.
	self session addFilter: filter.
	child inform: 'Congratulations, you have been authenticated. The new filter should be visible in the list above. Clicking on "ok" should remove the filter. Using the back button and hitting refresh should show the filter again.' onAnswer: [ self session removeFilter: filter ]
]

{ #category : #hooks }
WAFilterFunctionalTest >> children [
	^ Array with: child
]

{ #category : #initialization }
WAFilterFunctionalTest >> initialize [
	super initialize.
	child := WAComponent new
]

{ #category : #actions }
WAFilterFunctionalTest >> protector [
	| filter |
	"We could use #filterWith:during: but that requires Flow."
	filter := WAProtectionFilter new.
	self session addFilter: filter.
	child inform: 'Open this page on a different computer by copying the complete URL to a machine with a different IP address. Seaside should reply with a forbidden message. Closing this dialog should remove the filter.' onAnswer: [ self session removeFilter: filter ]
]

{ #category : #rendering }
WAFilterFunctionalTest >> renderActionsOn: html [
	html paragraph: [
		html anchor
			callback: [ self authentication ];
			with: 'Basic Authentication'.
		html text: ' (admin/seaside)'.
		html break.
		html anchor
			callback: [ self protector ];
			with: 'Session Protector' ].
	html horizontalRule.
	html paragraph: self children
]

{ #category : #rendering }
WAFilterFunctionalTest >> renderContentOn: html [
	self renderFiltersOn: html.
	self renderActionsOn: html
]

{ #category : #rendering }
WAFilterFunctionalTest >> renderFiltersOn: html [
	html paragraph: 'Below a list of filters wrapping the current session:'.
	html orderedList list: self session filters
]

{ #category : #private }
WAFilterFunctionalTest >> verifyPassword: aPasswordString forUser: aUserString [
	^ aUserString = 'admin' and: [ aPasswordString = 'seaside' ]
]
