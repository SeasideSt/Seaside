"
A WAPathConsumer keeps track of the unconsumed path elements in request handling.

Image the following request path:
/start/middle/end
and a dispatcher mapped at 'start' and an application mapped at 'middle'.
First nothing at all would be consumed so the unconsumed path would be #('start' 'middle' 'end').
Then the dispatcher consumes 'start' and delegates to the application so the unconsumed path would be #('middle' 'end').
Then the application consumes 'middle' so the unconsumed path would be #('end').
In that case
self requestContext consumer peek
inside an #initialRequest: should answer 'end'.

Instance Variables
	path:		<Collection<String>>

path
	- the collection of unconsumed path elements

"
Class {
	#name : #WAPathConsumer,
	#superclass : #WAObject,
	#instVars : [
		'path'
	],
	#category : 'Seaside-Core-RequestHandling'
}

{ #category : #'instance creation' }
WAPathConsumer class >> path: aCollectionOfStrings [
	^ self basicNew initializeWith: aCollectionOfStrings
]

{ #category : #accessing }
WAPathConsumer >> atEnd [
	"Answer whether there are any unconsumed path elements left."

	^ path isEmpty
]

{ #category : #initialization }
WAPathConsumer >> initializeWith: aCollectionOfStrings [
	self initialize.
	path := aCollectionOfStrings
]

{ #category : #accessing }
WAPathConsumer >> next [
	"Remove the first unconsumed path element and answer it."

	^ path removeFirst
]

{ #category : #accessing }
WAPathConsumer >> nextIfPresentDo: aOneArgumentBlock [
	"Evaluate the given block with #next if not #atEnd."
	self atEnd
		ifFalse: [ aOneArgumentBlock value: self next ]
]

{ #category : #accessing }
WAPathConsumer >> peek [
	"Answer the first unconsumed path element without removing it."

	^ path first
]

{ #category : #accessing }
WAPathConsumer >> peekToEnd [
	"answer the remaining elements in my path without consuming them"
	^ Array withAll: path
]

{ #category : #accessing }
WAPathConsumer >> try: aString [
	"See if the next element in the stream matches aString.
	If it does, consume the element and return true.
	If it does not or we are at the end of the stream, simply return false."

	(self atEnd or: [ self peek ~= aString ])
		ifTrue: [ ^ false ].
	self next.
	^ true
]

{ #category : #accessing }
WAPathConsumer >> upToEnd [
	"answer the remaining elements in my path"
	| elements |
	elements := path.
	path := #().
	^ elements
]
