Class {
	#name : 'WAObjectsReadFilter',
	#superclass : 'WARequestFilter',
	#instVars : [
		'items'
	],
	#category : 'Seaside-GemStone-Development-Core',
	#package : 'Seaside-GemStone-Development',
	#tag : 'Core'
}

{ #category : 'processing' }
WAObjectsReadFilter >> handleFiltered: aRequestContext [
	| size item |

	item := WAObjectsReadItem request: aRequestContext request copy.
	item start: DateAndTime now truncated.
	System _enableTraceObjectsRead.
	[  super handleFiltered: aRequestContext ]
		ensure: [ 
			size := System _disableTraceObjectsRead.
			item
				end: DateAndTime now truncated;
				size: size; 
				objectsRead: (System _hiddenSetAsArray: 5).
			items := items copyWith: item ]
]

{ #category : 'accessing' }
WAObjectsReadFilter >> items [
	^ items
]

{ #category : 'processing' }
WAObjectsReadFilter >> reset [
	items := Array new
]
