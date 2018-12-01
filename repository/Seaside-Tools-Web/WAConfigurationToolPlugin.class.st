"
Abstract root class for all plugins that add an action for an application to the dispatcher editor.
"
Class {
	#name : #WAConfigurationToolPlugin,
	#superclass : #WAPlugin,
	#instVars : [
		'handler'
	],
	#category : 'Seaside-Tools-Web'
}

{ #category : #'instance creation' }
WAConfigurationToolPlugin class >> allSubclassesOn: aTargetObject for: aRequestorObject [
	| plugins |
	plugins := self allSubclasses
		collect: [ :each | each on: aTargetObject for: aRequestorObject ].
	^ plugins sorted
]

{ #category : #'instance creation' }
WAConfigurationToolPlugin class >> on: aTargetObject for: aRequestorObject [
	^ self basicNew initializeHandler: aTargetObject requestor: aRequestorObject
]

{ #category : #accessing }
WAConfigurationToolPlugin >> cssClass [
	"Answer a CSS class that will be applied to an automatically rendered link."

	^ 'wa-action'
]

{ #category : #accessing }
WAConfigurationToolPlugin >> handler [
	^ handler
]

{ #category : #initialization }
WAConfigurationToolPlugin >> initializeHandler: aHandlerObject requestor: aRequestorObject [
	self initializeRequestor: aRequestorObject.
	handler := aHandlerObject

]
