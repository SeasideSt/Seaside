Class {
	#name : #WARegistryConfiguration,
	#superclass : #WASystemConfiguration,
	#category : 'Seaside-Core-RequestHandling'
}

{ #category : #description }
WARegistryConfiguration >> describeOn: config [
	(config list: #trackingStrategy)
		comment: 'How handlers should be tracked.';
		options: [ Array with: WAQueryFieldHandlerTrackingStrategy new ];
		default: WAQueryFieldHandlerTrackingStrategy new
]

{ #category : #ancestry }
WARegistryConfiguration >> parents [
	^ Array with: WARequestHandlingConfiguration instance
]
