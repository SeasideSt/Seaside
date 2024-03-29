Class {
	#name : 'WAObjectsReadItem',
	#superclass : 'WAObject',
	#instVars : [
		'request',
		'objectsRead',
		'size',
		'start',
		'end'
	],
	#category : 'Seaside-GemStone-Development-Core',
	#package : 'Seaside-GemStone-Development',
	#tag : 'Core'
}

{ #category : 'instance creation' }
WAObjectsReadItem class >> request: aRequest [
	^ self basicNew initializeOn: aRequest; yourself
]

{ #category : 'accessing' }
WAObjectsReadItem >> end [
	
	^ end
]

{ #category : 'accessing' }
WAObjectsReadItem >> end: aDateAndTime [
	
	end := aDateAndTime
]

{ #category : 'initialization' }
WAObjectsReadItem >> initializeOn: aRequest [
	self initialize.
	request := aRequest
]

{ #category : 'accessing' }
WAObjectsReadItem >> objectsRead [

   "Return the value of the instance variable 'objectsRead'."
   ^objectsRead
]

{ #category : 'updating' }
WAObjectsReadItem >> objectsRead: newValue [

   "Modify the value of the instance variable 'objectsRead'."
   objectsRead := newValue
]

{ #category : 'as yet unclassified' }
WAObjectsReadItem >> report [

	| objects |
	
	objects := (objectsRead groupBy:[:e | e class ] having:[:e | true ]) associations sorted:[:a :b | a value size >  b value size ].
	^ String streamContents:[:str |
		objects do:[:assoc |
			str 
				nextPutAll: assoc key name;
				nextPutAll: '->';
				nextPutAll: assoc value size asString;
				cr ] ]
]

{ #category : 'accessing' }
WAObjectsReadItem >> request [

   "Return the value of the instance variable 'request'."
   ^request
]

{ #category : 'updating' }
WAObjectsReadItem >> request: newValue [

   "Modify the value of the instance variable 'request'."
   request := newValue
]

{ #category : 'accessing' }
WAObjectsReadItem >> size [

   "Return the value of the instance variable 'size'."
   ^size
]

{ #category : 'updating' }
WAObjectsReadItem >> size: newValue [

   "Modify the value of the instance variable 'size'."
   size := newValue
]

{ #category : 'accessing' }
WAObjectsReadItem >> start [
	
	^ start
]

{ #category : 'accessing' }
WAObjectsReadItem >> start: aDateAndTime [
	
	start := aDateAndTime
]
