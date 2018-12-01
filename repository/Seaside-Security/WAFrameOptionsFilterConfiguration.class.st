"
I am the configuration for WAFrameOptionsFilter.
"
Class {
	#name : #WAFrameOptionsFilterConfiguration,
	#superclass : #WASystemConfiguration,
	#category : 'Seaside-Security'
}

{ #category : #description }
WAFrameOptionsFilterConfiguration >> describeOn: config [
	(config list: #frameOptions)
		comment: 'The places where framing should be allowed.';
		options: [ #('DENY' 'SAMEORIGIN') ];
		default: 'DENY'
]
