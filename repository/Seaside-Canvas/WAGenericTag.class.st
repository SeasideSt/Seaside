"
A WAGenericTag is the class for all tags that do not have a class of their own.

Instance Variables
	tag:		<String>

tag
	- the name of the tag

"
Class {
	#name : #WAGenericTag,
	#superclass : #WATagBrush,
	#instVars : [
		'tag'
	],
	#category : 'Seaside-Canvas-Base'
}

{ #category : #'instance creation' }
WAGenericTag class >> tag: aString [
	^ self basicNew initializeWithTag: aString; yourself
]

{ #category : #initialization }
WAGenericTag >> initializeWithTag: aString [
	self initialize.
	tag := aString
]

{ #category : #accessing }
WAGenericTag >> tag [
	^ tag
]
