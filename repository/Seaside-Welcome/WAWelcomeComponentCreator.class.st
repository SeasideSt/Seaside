Class {
	#name : #WAWelcomeComponentCreator,
	#superclass : #WATask,
	#category : 'Seaside-Welcome'
}

{ #category : #tasks }
WAWelcomeComponentCreator >> checkAuthorInitials [
	GRPlatform current seasideIsAuthorNameSet
		ifFalse: [ self call: WAWelcomeAuthorNamePrompter new ] 
	

]

{ #category : #tasks }
WAWelcomeComponentCreator >> chooseComponentName [
	^ self call: WAWelcomeComponentNamePrompter new 
	

]

{ #category : #tasks }
WAWelcomeComponentCreator >> createComponent: componentName [
	| userComponent |
	
	Smalltalk globals at: componentName ifPresent: [ :class |
		self inform: 'Sorry a component named: ''', componentName, ''' already exists, please choose a different name.'. 
		^ nil ].
	componentName first isLetter ifFalse: [
		self inform: '''', componentName, ''' is not a valid name for a component. Component names should begin with a letter. Please choose again.'.
		^ nil ].
	
	userComponent := WAComponent
		subclass: componentName
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: 'Seaside-User-Examples'.
		
	userComponent isNil ifTrue: [
		self inform: 'A problem occurred creating ''', componentName, ''' component..'.
		^ nil ].
	
	GRPlatform current 
		compile: self sampleComponentRenderMethod
		into: userComponent
		classified: #rendering.
	
	WAAdmin register: userComponent asApplicationAt: componentName.	
		
	^ userComponent new

	

]

{ #category : #tasks }
WAWelcomeComponentCreator >> displayComponent: component named: componentName [
	self call: (WAWelcomeComponentConfirmation component: component named: componentName)




	

]

{ #category : #running }
WAWelcomeComponentCreator >> go [
	| componentName component |
	
	[
		[
			componentName := self chooseComponentName.
			self checkAuthorInitials.
   			component := self createComponent: componentName.
		
			component isNil
		] whileTrue.

	    	self displayComponent: component named: componentName
	] repeat
	

]

{ #category : #private }
WAWelcomeComponentCreator >> sampleComponentRenderMethod [
	^ 'renderContentOn: html
	html image url: ''http://www.seaside.st/styles/logo-plain.png''.
	html paragraph: ''Hello World from Seaside.''.
	html paragraph: [ 
		html text: ''To learn more about Seaside components follow the link to the book: ''.
		html anchor
			url: ''http://book.seaside.st/book/fundamentals/rendering-components'';
			with: ''Dynamic Web Development with Seaside''.
		html text: ''.'' ]'
]
