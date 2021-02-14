"
A WAVMParameterEditor is an dialog that allows the user to edit a virtual machine parameter.
"
Class {
	#name : #WAVMParameterEditor,
	#superclass : #WAComponent,
	#instVars : [
		'memoryInput',
		'parameterIndex'
	],
	#category : 'Seaside-Pharo-Tools-Web'
}

{ #category : #'instance creation' }
WAVMParameterEditor class >> paramterIndex: anInteger [ 
	^ self basicNew
		initializeWithParameter: anInteger;
		yourself
]

{ #category : #accessing }
WAVMParameterEditor >> children [
	^ Array with: memoryInput
]

{ #category : #initialization }
WAVMParameterEditor >> initialize [
	super initialize.
	memoryInput := WAMemoryInput new
]

{ #category : #initialization }
WAVMParameterEditor >> initializeWithParameter: anInteger [
	self initialize.
	parameterIndex := anInteger.
	memoryInput := WAMemoryInput bytes: (SmalltalkImage current vm parameterAt: anInteger)
]

{ #category : #actions }
WAVMParameterEditor >> ok [
	SmalltalkImage current vm
		parameterAt: parameterIndex
		put: memoryInput bytes.
	self answer
]

{ #category : #rendering }
WAVMParameterEditor >> renderContentOn: html [
	html form: [
		html paragraph: [ 
			html render: memoryInput.
			html submitButton
				text: 'OK';
				callback: [ self ok ] ] ]
]
