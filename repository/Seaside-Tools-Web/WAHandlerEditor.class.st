Class {
	#name : #WAHandlerEditor,
	#superclass : #WAComponent,
	#instVars : [
		'handler',
		'filterEditor',
		'configurationEditor'
	],
	#category : 'Seaside-Tools-Web'
}

{ #category : #'instance creation' }
WAHandlerEditor class >> new [
	^ self on: nil
]

{ #category : #'instance creation' }
WAHandlerEditor class >> on: anEntryPoint [
	^ self basicNew initializeOn: anEntryPoint; yourself
]

{ #category : #hooks }
WAHandlerEditor >> children [
	^ Array with: filterEditor with: configurationEditor
]

{ #category : #accessing }
WAHandlerEditor >> editor [
	^ configurationEditor
]

{ #category : #accessing }
WAHandlerEditor >> handler [
	^ handler
]

{ #category : #initialization }
WAHandlerEditor >> initializeOn: aHandler [
	self initialize.
	handler := aHandler.
	filterEditor := WAFilterAttributeEditor new handler: handler; group: #filters; parent: self; yourself.
	aHandler configuration isNil ifFalse: [
		configurationEditor := aHandler configuration configurationComponent.
		configurationEditor parent: self.
		configurationEditor onAnswer: [ self answer ] ]
]

{ #category : #accessing }
WAHandlerEditor >> parent [
	"editor parent component hack"

	^ self
]

{ #category : #rendering }
WAHandlerEditor >> renderConfigurationOn: html [
	self handler configuration isNil
		ifFalse: [ html render: configurationEditor ]
]

{ #category : #rendering }
WAHandlerEditor >> renderContentOn: html [
	self renderSubItemsOn: html.
	self renderFiltersOn: html.
	self renderHandlerOn: html
]

{ #category : #rendering }
WAHandlerEditor >> renderFiltersOn: html [
	html render: filterEditor
]

{ #category : #rendering }
WAHandlerEditor >> renderHandlerOn: html [
	self renderConfigurationOn: html
]

{ #category : #rendering }
WAHandlerEditor >> renderSubItemsOn: html [

]
