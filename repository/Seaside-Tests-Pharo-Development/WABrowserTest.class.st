Class {
	#name : #WABrowserTest,
	#superclass : #TestCase,
	#instVars : [
		'message'
	],
	#category : 'Seaside-Tests-Pharo-Development'
}

{ #category : #'requestor-fake' }
WABrowserTest >> notify: aString at: location in: sourceStream [
	message := aString allButLast: 3
]

{ #category : #running }
WABrowserTest >> runCase [
	GRPlatform current doSilently:  [ super runCase ]
]

{ #category : #'requestor-fake' }
WABrowserTest >> selectFrom: aPos to: anotherPos [
]

{ #category : #'requestor-fake' }
WABrowserTest >> selectionInterval [
	^ 1 to: 1
]

{ #category : #testing }
WABrowserTest >> testContentsNotifying [
	| model |
	model := WABrowser browserClass new.
	model systemCategoryListIndex: (model systemCategoryList indexOf: 'Seaside-Tests-Pharo-Development').
	model classListIndex: (model classList indexOf: #WABrowserTest).
	model messageCategoryListIndex: (model messageCategoryList indexOf: #'-- all --').
	[ 
		self assert:
			(model contents: 'sampleMethod
			^ 1 + 1'
			notifying: self).
		self assert: message isNil ]
		ensure: [ WABrowserTest removeSelectorSilently: #sampleMethod ]
]

{ #category : #'requestor-fake' }
WABrowserTest >> text [
	^ Text fromString: ''
]
