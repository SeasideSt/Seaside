"
I am a helper to implement a workaround to pass the environment of the GsProcess where a partial continuation is restored, such that GRDynamicVariable works as expected in the presence of partial continuations. See https://github.com/SeasideSt/Seaside/issues/1198
"
Class {
	#name : #WAGemStoneProcessEnvironmentWrapper,
	#superclass : #Object,
	#instVars : [
		'environment',
		'value'
	],
	#category : 'Seaside-GemStone-Continuation'
}

{ #category : #'instance creation' }
WAGemStoneProcessEnvironmentWrapper class >> withEnvironment: aProcessEnvironment value: anObject [
  ^ self basicNew environment: aProcessEnvironment value: anObject
]

{ #category : #initialization }
WAGemStoneProcessEnvironmentWrapper >> environment: aProcessEnvironment value: anObject [
  environment := aProcessEnvironment.
  value := anObject
]

{ #category : #testing }
WAGemStoneProcessEnvironmentWrapper >> isProcessEnvironmentWrapper [
  ^ true
]

{ #category : #accessing }
WAGemStoneProcessEnvironmentWrapper >> restoreEnvironmentAndReturnValue [
  Processor activeProcess environment: environment.
  ^ value
]
