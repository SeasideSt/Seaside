"
A RRSystemConfiguration is the configuration of an RRRssHandler.
"
Class {
	#name : #RRSystemConfiguration,
	#superclass : #WASystemConfiguration,
	#category : 'RSS-Core'
}

{ #category : #description }
RRSystemConfiguration >> describeOn: config [
	(config classBinding: #rootComponentClass)
		label: 'Root Component';
		options: [ self rootComponents ].
	config at: #documentClass putClass: WAXmlDocument
]

{ #category : #ancestry }
RRSystemConfiguration >> parents [
	^ Array with: WARequestHandlingConfiguration instance
]

{ #category : #accessing }
RRSystemConfiguration >> rootComponents [
	^ (RRComponent allSubclasses select: [ :each | each canBeRoot ])
		asSortedCollection: [ :a :b | a name <= b name ]
]
