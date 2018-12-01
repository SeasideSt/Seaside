Class {
	#name : #SUPeriodicalTest,
	#superclass : #SUFunctionalTest,
	#category : 'Scriptaculous-Tests-Core-Functional'
}

{ #category : #rendering }
SUPeriodicalTest >> renderContentOn: html [
	html paragraph
		script: (html scriptaculous updater
			interval: 1 seconds;
			on: #renderTimeOn: of: self);
		with: [ self renderTimeOn: html ]
]

{ #category : #rendering }
SUPeriodicalTest >> renderTimeOn: html [
	html render: Time now
]
