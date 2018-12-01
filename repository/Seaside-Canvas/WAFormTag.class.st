"
The FORM element acts as a container for input elements and buttons.

Evaluation order:
The input fields callbacks will be evaluated in the order they
appear in the XHTML. Buttons will always be evaluated last, no matter
where they are positioned.
"
Class {
	#name : #WAFormTag,
	#superclass : #WABasicFormTag,
	#instVars : [
		'defaultAction'
	],
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #private }
WAFormTag >> after [
	super after.
	self isGet ifTrue: [
		"Normally we have the session and continuation id in the action URL. However
		in the case of a GET <form> the browser will drop them."
		canvas div: [
			canvas actionUrl queryFields keysAndValuesDo: [ :k :v |
				canvas hiddenInput
					name: k;
					value: v ] ] ]
]

{ #category : #private }
WAFormTag >> before [
	"Define the default action form buttons. Some implementation notes on this feature: (1) a tab-index of -1 is not valid XHTML, but most todays browser accept it and ignore the element in the tab-order. (2) Internet Explorer requires an additional text field (without other functionality) to make the default action work. Other browser should not include this text-field, as it prevents remembering form input."

	super before.
	defaultAction ifNil: [ ^ nil ].
	canvas div: [
		canvas submitButton
			tabIndex: -1;
			value: 'Default';
			callback: defaultAction;
			style: 'position: absolute; top: -100em'.
		self isInternetExplorer ifTrue: [
			canvas textInput
				tabIndex: -1;
				callback: [ :v | ];
				style: 'position: absolute; top: -100em' ] ]
]

{ #category : #callbacks }
WAFormTag >> defaultAction: aBlock [
	"The default action gets evaluated whenever the user presses submits
	the form by pressing enter without having the focus on a specific
	submit-button."
	defaultAction := aBlock
]

{ #category : #testing }
WAFormTag >> isGet [
	^ (self attributeAt: 'method') = 'get'
]

{ #category : #private }
WAFormTag >> isInternetExplorer [
	"Tries to find out whether the current request is made by IE. This is extremely unreliable."
	| userAgent |
	userAgent := self requestContext request userAgent.
	^ userAgent notNil
		and: [ (userAgent indexOfSubCollection: 'MSIE' startingAt: 1) ~= 0
		and: [ (userAgent indexOfSubCollection: 'Opera' startingAt: 1) = 0 ] ]
]
