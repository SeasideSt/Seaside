"
I am the configuration for WAFrameOptionsAllowFromFilter.
"
Class {
	#name : #WAFrameOptionsAllowFromFilterConfiguration,
	#superclass : #WASystemConfiguration,
	#category : 'Seaside-Security'
}

{ #category : #description }
WAFrameOptionsAllowFromFilterConfiguration >> describeOn: config [
	(config string: #origin)
		comment: 'The origin from where framing should be allowed (unsupported by IE).'
]
