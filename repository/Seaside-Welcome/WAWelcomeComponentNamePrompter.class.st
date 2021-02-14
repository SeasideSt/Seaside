Class {
	#name : #WAWelcomeComponentNamePrompter,
	#superclass : #WAComponent,
	#instVars : [
		'componentName'
	],
	#category : 'Seaside-Welcome'
}

{ #category : #accessing }
WAWelcomeComponentNamePrompter >> componentName [
	^ componentName ifNil: [ componentName := 'MyFirstComponent' ]
]

{ #category : #accessing }
WAWelcomeComponentNamePrompter >> componentName: anObject [
	componentName := anObject
]

{ #category : #rendering }
WAWelcomeComponentNamePrompter >> renderContentOn: html [
	html form: [
		html text: 'Name your component: '.
		html textInput
			on: #componentName of: self.
		html submitButton
			text: 'Create';
			callback: [ self answer: self componentName capitalized asSymbol ] ]
]
