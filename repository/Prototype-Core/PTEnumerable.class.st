"
Enumerable provides a large set of useful methods for enumerations, that is, objects that act as collections of values. It is a cornerstone of Prototype.
"
Class {
	#name : #PTEnumerable,
	#superclass : #PTObject,
	#instVars : [
		'receiver'
	],
	#category : 'Prototype-Core'
}

{ #category : #'instance creation' }
PTEnumerable class >> context: aRenderContext receiver: anObject [
	^ (self context: aRenderContext) receiver: anObject
]

{ #category : #querying }
PTEnumerable >> all: anObject [
	"Determines whether all the elements are boolean-equivalent to true, either directly or through computation by the provided iterator."

	self call: 'all' with: (self iteratorFor: anObject)
]

{ #category : #enumerating }
PTEnumerable >> allSatisfy: anObject [
	^ self all: anObject
]

{ #category : #querying }
PTEnumerable >> any: anObject [
	"Determines whether at least one element is boolean-equivalent to true, either directly or through computation by the provided iterator."

	self call: 'any' with: (self iteratorFor: anObject)
]

{ #category : #enumerating }
PTEnumerable >> anySatisfy: anObject [
	^ self any: anObject
]

{ #category : #enumerating }
PTEnumerable >> collect: anObject [
	^ self map: anObject
]

{ #category : #enumerating }
PTEnumerable >> detect: anObject [
	^ self find: anObject
]

{ #category : #enumerating }
PTEnumerable >> detectMax: anObject [
	^ self max: anObject
]

{ #category : #enumerating }
PTEnumerable >> detectMin: anObject [
	^ self min: anObject
]

{ #category : #enumerating }
PTEnumerable >> do: anObject [
	^ self each: anObject
]

{ #category : #querying }
PTEnumerable >> each: anObject [
	"The cornerstone of Enumerable. It lets you iterate over all the elements in a generic fashion, then returns the Enumerable, thereby allowing chain-calling."

	self call: 'each' with: (self iteratorFor: anObject return: false)
]

{ #category : #querying }
PTEnumerable >> find: anObject [
	"Finds the first element for which the iterator returns true."

	self call: 'find' with: (self iteratorFor: anObject)
]

{ #category : #querying }
PTEnumerable >> findAll: anObject [
	"Returns all the elements for which the iterator returned true."

	self call: 'findAll' with: (self iteratorFor: anObject)
]

{ #category : #querying }
PTEnumerable >> grep: aString [
	"Returns all the elements whose string representations match the regular expression."

	self call: 'grep' with: aString
]

{ #category : #querying }
PTEnumerable >> include: anObject [
	"Determines whether a given object is in the Enumerable or not, based on the == comparison operator."

	self call: 'include' with: anObject
]

{ #category : #querying }
PTEnumerable >> invoke: aString [
	"Invokes the same method, with the same arguments, for all items in a collection. Returns the results of the method calls."
	
	self invoke: aString withAll: #()
]

{ #category : #querying }
PTEnumerable >> invoke: aString with: anObject [
	"Invokes the same method, with the same arguments, for all items in a collection. Returns the results of the method calls."

	self invoke: aString withAll: (Array with: anObject)
]

{ #category : #querying }
PTEnumerable >> invoke: aString withAll: anArray [
	"Invokes the same method, with the same arguments, for all items in a collection. Returns the results of the method calls."

	self call: 'invoke' withArguments: (Array with: aString) , anArray
]

{ #category : #private }
PTEnumerable >> iteratorFor: anObject [
	^ self iteratorFor: anObject return: true
]

{ #category : #private }
PTEnumerable >> iteratorFor: anObject return: aBoolean [
	^ anObject isBlock
		ifFalse: [ anObject asFunction ]
		ifTrue: [ 
			(JSFunction context: self renderContext iterator: anObject)
				rendererClass: self rendererClass;
				return: aBoolean ]
]

{ #category : #printing }
PTEnumerable >> javascriptContentOn: aStream [
	aStream javascript: self receiver
]

{ #category : #querying }
PTEnumerable >> map: anObject [
	"Returns the results of applying the iterator to each element."

	self call: 'map' with: (self iteratorFor: anObject)
]

{ #category : #querying }
PTEnumerable >> max: anObject [
	"Returns the maximum element (or element-based computation), or undefined if the enumeration is empty. Elements are either compared directly, or by first applying the iterator and comparing returned values."

	self call: 'max' with: (self iteratorFor: anObject)
]

{ #category : #querying }
PTEnumerable >> min: anObject [
	"Returns the minimum element (or element-based computation), or undefined if the enumeration is empty. Elements are either compared directly, or by first applying the iterator and comparing returned values."

	self call: 'min' with: (self iteratorFor: anObject)
]

{ #category : #querying }
PTEnumerable >> pluck: aString [
	"Optimization for a common use-case of collect: fetching the same property for all the elements. Returns the property values."

	self call: 'pluck' with: aString
]

{ #category : #accessing }
PTEnumerable >> receiver [
	^ receiver
]

{ #category : #accessing }
PTEnumerable >> receiver: anObject [
	receiver := anObject
]

{ #category : #querying }
PTEnumerable >> reject: anObject [
	"Returns all the elements for which the iterator returned false."

	self call: 'reject' with: (self iteratorFor: anObject)
]

{ #category : #enumerating }
PTEnumerable >> select: anObject [
	^ self findAll: anObject
]

{ #category : #querying }
PTEnumerable >> size [
	"Return the size of the enumeration."

	self call: 'size'
]

{ #category : #querying }
PTEnumerable >> sortBy: anObject [
	"Provides a custom-sorted view of the elements based on the criteria computed, for each element, by the iterator."

	self call: 'sortBy' with: (self iteratorFor: anObject)
]
