Class {
	#name : 'WAMethodEditorComponent',
	#superclass : 'WAComponent',
	#instVars : [
		'methodRetrievalBlock'
	],
	#category : 'Seaside-HotwireTurbo-ClassBrowserExample',
	#package : 'Seaside-HotwireTurbo-ClassBrowserExample'
}

{ #category : 'instance creation' }
WAMethodEditorComponent class >> on: aBlock [

	^ self new methodRetrievalBlock: aBlock
]

{ #category : 'initialization' }
WAMethodEditorComponent >> methodRetrievalBlock: aBlock [

	methodRetrievalBlock := aBlock
]

{ #category : 'rendering' }
WAMethodEditorComponent >> renderCodeInputConfigurationOn: html [

	html script
		with: 'codeInput.registerTemplate("syntax-highlighted", codeInput.templates.hljs(hljs, [] /* Array of plugins (see below) */));'
]

{ #category : 'rendering' }
WAMethodEditorComponent >> renderContentOn: html [

	| method methodSource |
	method := methodRetrievalBlock value.
	methodSource := method ifNil:[ '' ] ifNotNil:[ method sourceCode ].
	(html tag: 'code-input')
		stimulusController: 'code-editor';
		attributeAt: 'placeholder' put: self class sourceCodeTemplate;
		attributeAt: 'onchange' put: (html jQuery ajax callback: [ :source | methodSource := source ] value: (JSStream on: 'this.value'));
		attributeAt: 'language' put: 'Smalltalk';
		style: 'height: 400px; width: 100%';
		with: methodSource.

	html anchor
		class: 'btn elevated';
		turboConfirm: 'Are you sure?';
		callback: [ self saveMethodWith: methodSource ];
		with: 'Save'.
		
	"self renderCodeInputConfigurationOn: html."
]

{ #category : 'actions' }
WAMethodEditorComponent >> saveMethodWith: sourceCode [

	| method |
	method := methodRetrievalBlock value.
	method methodClass compile: sourceCode withInternalLineEndings
]
