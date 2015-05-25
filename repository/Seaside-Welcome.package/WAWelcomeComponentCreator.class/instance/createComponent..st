tasks
createComponent: componentName
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

	
