Class {
	#name : #WAWelcomeExampleFlow,
	#superclass : #WAWelcomeExample,
	#instVars : [
		'taskExample'
	],
	#category : 'Seaside-Welcome'
}

{ #category : #hooks }
WAWelcomeExampleFlow >> children [
	^ Array with: self taskExample
]

{ #category : #rendering }
WAWelcomeExampleFlow >> renderChooseCheeseCodeOn: html [
	html preformatted class: #codeSample; with: [
		html span class: #patternUnary; with: 'chooseCheese'. html break.
		html span class: #instanceVar; with: '    cheese'. html text: ' := '. html span class: #self; with: 'self'. html break.
		html text: '        chooseFrom: '. html span class: #symbol; with: '#'. html text: '( '. html span class: #string; with: '''Greyerzer'' ''Tilsiter'' ''Sbrinz'''. html text: ' )'. html break.
		html text:'        caption: '. html span class: #string; with: '''What''''s your favorite cheese?'''. html text: '.'. html break.
		html span class: #instanceVar; with: '    cheese'. html text: ' isNil ifTrue: [ '. html span class: #self; with: 'self'. html text:' chooseCheese ]' ]

]

{ #category : #rendering }
WAWelcomeExampleFlow >> renderConfirmCheeseCodeOn: html [
	html preformatted class: #codeSample; with: [
		html span class: #patternUnary; with: 'confirmCheese'. html break.
		html text: '    ^ '. html span class: #self; with: 'self'. html text: ' confirm: '. html span class: #string; with: '''Is '''. html text:', '. html span class: #instanceVar; with: 'cheese'. html text: ','. html span class: #string; with: ''' your favorite cheese?'''. html break ]

]

{ #category : #rendering }
WAWelcomeExampleFlow >> renderExampleOn: html [
	html paragraph: 'Complex, multi-page workflows can be expressed in Seaside with a single method. Unlike many web frameworks  which require a separate handler for each page or request, Seaside models an entire user session as a continuous piece of code, with natural, linear control flow.'.

	html div class: #seasideExample; with: self taskExample.
		
	html paragraph: [		
		html text: 'This example subclasses '; code: 'WATask'; text: ' and implements the hook method '; code: '#go'.
		html text: '. We store the user''s choice in an instance variable named '; code: 'cheese.' ].

	self renderGoCodeOn: html.
	
	html paragraph: [
		html text: 'To allow the user to choose from a list of famous Swiss cheeses, we use the convenience method '; code: '#chooseFrom:caption:'; text: ' which returns the chosen element from a collection or '; code: 'nil'; text: ' if the user cancels the dialog. If '; code: 'nil'; text: ' is returned, we simply ask again.' ].
	
	self renderChooseCheeseCodeOn: html.
	
	html paragraph: [
		html text: 'Then we ask the user to confirm their choice. The '; code: '#confirm:'; text: ' method answers a '; code: 'boolean:' ].
	
	self renderConfirmCheeseCodeOn: html.
	
	html paragraph: [
		html text: 'Finally we display the user''s choice using '; code: '#inform:.' ].
	
	self renderInformCheeseCodeOn: html.
	
	html paragraph: 'As simple as that. And yes, the browser''s Back button still works.'
		

]

{ #category : #rendering }
WAWelcomeExampleFlow >> renderGoCodeOn: html [
	html preformatted class: #codeSample; with: [
		html span class: #patternUnary; with: 'go'. html break.
		html text: '    [ '. html span class: #self; with: 'self'. html text: ' chooseCheese.'. html break.
		html text: '      '. html span class: #self; with: 'self'. html text: ' confirmCheese'. html text: ' ] whileFalse.'. html break.
		html text: '    '. html span class: #self; with: 'self'. html text: ' informCheese.' ]
]

{ #category : #rendering }
WAWelcomeExampleFlow >> renderInformCheeseCodeOn: html [
	html preformatted class: #codeSample; with: [
		html span class: #patternUnary; with: 'informCheese'. html break.
		html span class: #self; with: '    self'. html text: ' inform: '. html span class: #string; with: '''Your favorite is '''. html text:', '. html span class: #instanceVar; with: 'cheese'. html text: ','. html span class: #string; with: '''.'''. html break ]
]

{ #category : #accessing }
WAWelcomeExampleFlow >> taskExample [
	^ taskExample ifNil: [ taskExample := WAFlowConvenienceFunctionalTest new ]
]

{ #category : #private }
WAWelcomeExampleFlow >> title [
	^ 'Task'
]
