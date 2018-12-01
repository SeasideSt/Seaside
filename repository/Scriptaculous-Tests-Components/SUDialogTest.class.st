Class {
	#name : #SUDialogTest,
	#superclass : #WAComponent,
	#instVars : [
		'answerBlock'
	],
	#category : 'Scriptaculous-Tests-Components'
}

{ #category : #delegation }
SUDialogTest >> answer: aBlock [
	aBlock fixCallbackTemps.
	answerBlock := aBlock
]

{ #category : #rendering }
SUDialogTest >> renderContentOn: html [
		html paragraph: 'Window answer test'.
		html paragraph: [
			html anchor
				onClick: (html prototype evaluator callback: [ :s | answerBlock value: s ]);
				with: 'OK' ]
]
