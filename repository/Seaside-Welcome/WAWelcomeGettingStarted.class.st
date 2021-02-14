Class {
	#name : #WAWelcomeGettingStarted,
	#superclass : #WAComponent,
	#instVars : [
		'componentCreator'
	],
	#category : 'Seaside-Welcome'
}

{ #category : #hooks }
WAWelcomeGettingStarted >> children [ 
	^ Array with: self componentCreator 
]

{ #category : #accessing }
WAWelcomeGettingStarted >> componentCreator [
	^ componentCreator ifNil: [ componentCreator := WAWelcomeComponentCreator new ]
]

{ #category : #rendering }
WAWelcomeGettingStarted >> renderContentOn: html [
	html heading
		level1;
		with: 'Getting started'.
			
	html heading
		level2
		with: 'Test the water with the steps below:'.
				
	html orderedList: [
		html listItem: [ self renderExamplesStepOn: html ].
		html listItem: [ self renderFirstComponentStepOn: html ].
		html listItem: [ self renderDocumentationStepOn: html ] ]

]

{ #category : #'rendering-steps' }
WAWelcomeGettingStarted >> renderDocumentationStepOn: html [
	html heading
		level3;
		with: 'Browse the documentation'.
		
	html unorderedList: [ 
		html listItem: [
			html text: 'The  '.
			html anchor
				url: 'http://book.seaside.st/';
				with: 'Seaside Book'.
			html text: ' will teach you all you need to know about Seaside and how to build killer web applications.' ].
		html listItem: [ 
			html text: 'The '.
			html anchor
				url: 'http://www.swa.hpi.uni-potsdam.de/seaside/tutorial';
				with: 'Seaside Tutorial'.
			html text: ' has 12 chapters and introduces a sample application to explain the main features of Seaside.' ] ]


]

{ #category : #'rendering-steps' }
WAWelcomeGettingStarted >> renderExamplesStepOn: html [
	html heading
		level3;
		with: 'Try out some examples'.
		
	html
		unorderedList: [ 
			html listItem: [ 
				html anchor
					callback: [ self show: WAWelcomeExampleCounter new ];
					with: 'Counter'.
				html text: ', a simple Seaside component.' ].
			html listItem: [
				html anchor
					callback: [ self show: WAWelcomeExampleMultiCounter new ];
					with: 'Multi-Counter'.
				html text: ', showing how Seaside components can be re-used.' ].
			html listItem: [ 
				html anchor
					callback: [ self show: WAWelcomeExampleFlow new ];
					with: 'Task'.
				html text: ', illustrating Seaside''s innovative approach to application control flow.' ] ]
]

{ #category : #'rendering-steps' }
WAWelcomeGettingStarted >> renderFirstComponentStepOn: html [
	html heading
		level3;
		with: 'Create your first component'.
		
	html render: self componentCreator

]
