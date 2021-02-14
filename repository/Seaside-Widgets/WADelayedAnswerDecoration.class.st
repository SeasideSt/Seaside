"
WADelayedAnswerDecoration adds a delay in displaying a component. 

See WADelayFunctionalTest for sample usage.
Select 'Delay"" tab of the Functional Seaside Test Suite to run an example  (http://127.0.0.1:xxxx/tests/functional/WADelayFunctionalTest)

Instance Variables:
	delay	<Integer>	delay length in seconds 


"
Class {
	#name : #WADelayedAnswerDecoration,
	#superclass : #WAWidgetDecoration,
	#instVars : [
		'delay'
	],
	#category : 'Seaside-Widgets-Decorations'
}

{ #category : #accessing }
WADelayedAnswerDecoration >> delay [
	^ delay ifNil: [ 1 ]
]

{ #category : #accessing }
WADelayedAnswerDecoration >> delay: aNumber [
	delay := aNumber
]

{ #category : #updating }
WADelayedAnswerDecoration >> updateRoot: anHtmlRoot [ 
	| url |
	super updateRoot: anHtmlRoot.
	url := anHtmlRoot context actionUrl withField:
				(anHtmlRoot context callbacks store:
					(WAActionCallback on: [ self decoratedComponent answer ])).
	anHtmlRoot meta 
		redirectAfter: self delay
		to: url greaseString
]
