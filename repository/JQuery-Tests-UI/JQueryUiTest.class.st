Class {
	#name : 'JQueryUiTest',
	#superclass : 'JQueryTest',
	#category : 'JQuery-Tests-UI-Unit',
	#package : 'JQuery-Tests-UI',
	#tag : 'Unit'
}

{ #category : 'testing' }
JQueryUiTest class >> isAbstract [
	^ self name = #JQueryUiTest
]

{ #category : 'accessing' }
JQueryUiTest class >> packageNamesUnderTest [
	^ #('JQuery-UI')
]
