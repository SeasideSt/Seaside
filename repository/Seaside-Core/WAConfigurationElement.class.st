Class {
	#name : #WAConfigurationElement,
	#superclass : #WAObject,
	#instVars : [
		'key'
	],
	#category : 'Seaside-Core-Configuration'
}

{ #category : #'instance creation' }
WAConfigurationElement class >> key: aSymbol [
	^ self basicNew initializeWithKey: aSymbol; yourself
]

{ #category : #initialization }
WAConfigurationElement >> initializeWithKey: aSymbol [
	self initialize.
	key := aSymbol
]

{ #category : #accessing }
WAConfigurationElement >> key [
	^ key
]
