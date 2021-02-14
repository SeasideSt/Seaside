Class {
	#name : #WAConfigurationMock,
	#superclass : #WASystemConfiguration,
	#instVars : [
		'describeBlock',
		'parentsBlock'
	],
	#category : 'Seaside-Tests-Core-Configuration'
}

{ #category : #'instance creation' }
WAConfigurationMock class >> new [
	"For testing, we'd rather create new instances than use singletons."
	^ self basicNew initialize
]

{ #category : #description }
WAConfigurationMock >> describeOn: config [
	describeBlock isNil ifFalse: [ describeBlock value: config ]
]

{ #category : #accessing }
WAConfigurationMock >> description: aBlock [
	describeBlock := aBlock
]

{ #category : #ancestry }
WAConfigurationMock >> parents [
	^ parentsBlock isNil 
		ifFalse: [ parentsBlock value ]
		ifTrue: 
			[ #() ]
]

{ #category : #accessing }
WAConfigurationMock >> parents: aBlock [ 
	parentsBlock := aBlock
]
