"
I am the configuration of WAHashCache.
"
Class {
	#name : #WACacheConfiguration,
	#superclass : #WASystemConfiguration,
	#category : 'Seaside-Core-Cache'
}

{ #category : #description }
WACacheConfiguration >> describeOn: config [
	(config integer: #maximumSize)
		comment: 'Number of sessions supported. When this limit is reached the overflow action is run. 0 for no maximum size. Has to be positive.';
		group: #cache;
		default: 10000.
	(config integer: #maximumRelativeAge)
		comment: 'After so many seconds of inactivity a session is considered expired. 0 for no limit. Has to be positive.';
		group: #cache;
		default: 1800. "30 min"
	(config integer: #maximumAbsoluteAge)
		comment: 'After so many seconds after its creation a session is considered expired no matter when it was last accessed. 0 for no limit. Has to be positive.';
		group: #cache;
		default: 28800. "8 h"
	(config list: #overflowAction)
		options: WAHashCache overflowActions;
		comment: 'What to do when the maximum number of sessions is reached. Only matters when the maximum size is bigger than 0.';
		group: #cache;
		default: WAHashCache removeRelativeOldest
]
