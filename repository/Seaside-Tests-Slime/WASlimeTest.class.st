Class {
	#name : 'WASlimeTest',
	#superclass : 'GRReSlimeTest',
	#category : 'Seaside-Tests-Slime',
	#package : 'Seaside-Tests-Slime'
}

{ #category : 'tests-block' }
WASlimeTest >> testCallSuperImplementation [

	| object painter |
	object := self
		defineClass: #WASlimeMockObject
		superclass: #WAObject.
	self compile: 'postCopy self postCopy' in: object. 
	painter := self
		defineClass: #WASlimeMockComponent
		superclass: #WAPainter.
	self compile:  'updateRoot: aHtmlRoot self updateUrl: aHtmlRoot' in: painter.
	self
		assertRule: WACallSuperImplementationRule
		matches: { object>>#postCopy . painter>>#updateRoot: }
]

{ #category : 'tests-block' }
WASlimeTest >> testChangesStateWhileRendering [

	| class |
	class := self defineSubClassOf: #WAComponent.
	class addInstVarNamed: 'foo'.
	self compile: 'renderContentOn: html html div: [ foo := nil ]' in: class.
	self 
		assertRule: WAChangesStateWhileRenderingRule
		matches: { class>>#renderContentOn: }
]

{ #category : 'tests-transform' }
WASlimeTest >> testCookieConversionRule [

	| class |
	class := self
		defineClass: #WASlimeServerAdaptor
		superclass: #WAServerAdaptor.
	self compile: 'method1 WACookie new oldNetscapeString' in: class.
	self compile: 'method2 WACookie new rfc2109String' in: class.
	self compile: 'method3 WACookie new rfc2965String' in: class.
	self 
		runTransformation: WACookieConversionRule
		changes: #(
			'method1 WACookie new rfc6265String'
			'method2 WACookie new rfc6265String'
			'method3 WACookie new rfc6265String'
		)
]

{ #category : 'tests-block' }
WASlimeTest >> testDoNotCombineMultiplePrimaryAjaxCallbacks [

	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	self compile: 'scriptOn: html html jQuery ajax callback:[ 1 ]; callback:[ 2 ]' in: class.
	self compile: 'scriptOn2: s s jQuery ajax callback:[ 1 ]; callback:[ 2 ]' in: class.
	self compile: 'scriptOn3: s s jQuery ajax callback:[ 1 ]; script:[ 2 ]' in: class.
	self compile: 'scriptOn4: s s jQuery ajax script: [ 1 ]; callback:[ 2 ]' in: class.
	self compile: 'scriptOn5: s s jQuery ajax script: [ 1 ]; callback:[ 2 ] value: 3' in: class.
	self compile: 'scriptOn6: s s jQuery ajax script: [ 1 ]; callback:[ 2 ] passengers: 3' in: class.
	self compile: 'scriptOn7: s s jQuery ajax callback:[ 2 ] passengers: 3; script: [ 1 ] ' in: class.
	self compile: 'scriptOn8: s s jQuery ajax callback:[ 2 ] value: 3; script: [ 1 ]' in: class.
	self 
		assertRule: WADoNotCombineMultiplePrimaryAjaxCallbacks
		matches: { class>>#scriptOn: . class>>#scriptOn2: . class>>#scriptOn3: . class>>#scriptOn4: }
]

{ #category : 'tests-block' }
WASlimeTest >> testDoNotUseWhileRendering [

	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	self compile: 'renderContentOn: html html div: [ self call: nil ]' in: class.
	self 
		assertRule: WADoNotUseWhileRenderingRule
		matches: { class>>#renderContentOn: }
]

{ #category : 'tests-block' }
WASlimeTest >> testDoNotUseWithinCallback [

	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	self compile: 'renderContentOn: html
		html anchor
			callback: [ html document addLoadScript: nil ];
			with: 123' in: class.
	self 
		assertRule: WADoNotUseWithinCallbackRule
		matches: { class>>#renderContentOn: }
]

{ #category : 'tests-parsetree' }
WASlimeTest >> testExtractCallbackCodeToMethod [

	| class |
	class := self defineSubClassOf: #WAComponent.
	self
		compile: 'renderInvalidOn: html
			html anchor 
				callback: [ self foo. self bar ];
				with: 1'
		in: class.
	self
		compile: 'renderValidOn: html
			html anchor 
				callback: [ self foo ];
				with: 1'
		in: class.
	self 
		assertRule: WAExtractCallbackCodeToMethodRule
		matches: { class>>#renderInvalidOn: }
]

{ #category : 'tests-block' }
WASlimeTest >> testInstantiatesComponentWhileRendering [

	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	self compile: 'renderContentOn: html html div: WAComponentStub new' in: class.
	self 
		assertRule: WAInstantiatesComponentWhileRenderingRule
		matches: { class>>#renderContentOn: }
]

{ #category : 'tests-parsetree' }
WASlimeTest >> testSendsRenderContentOn [

	| class |
	class := self defineSubClassOf: #WAComponent.
	self
		compile: 'invalid self renderContentOn: nil'
		in: class.
	self 
		assertRule: WASendsRenderContentOnRule
		matches: { class>>#invalid }
]

{ #category : 'tests-parsetree' }
WASlimeTest >> testSequencedAsynchronousCalls [

	| class |
	class := self defineSubClassOf: #WAComponent.
	self
		compile: 'renderContent1On: html
			html div
				onClick: (html jQuery ajax callback: [  ]) , (html jQuery ajax serializeForm);
				with: ''Click me'''
		in: class.
	self
		compile: 'renderContent2On: html
			html div
				onClick: (html jQuery ajax serializeForm; callback: [  ]) , (html jQuery effect bounce);
				with: ''Click me'''
		in: class.
	self
		compile: 'renderContent3On: html
			html div
				onClick: (html jQuery ajax serializeForm; callback: [  ]) / (html jQuery effect bounce);
				with: ''Click me'''
		in: class.
	self 
		assertRule: WASequencedAsynchronousCallsRule
		matches: { class>>#renderContent1On: . class>>#renderContent2On: }
]

{ #category : 'tests-parsetree' }
WASlimeTest >> testUnnecessaryBlockPassedToBrush [

	| class |
	class := self defineSubClassOf: #WAComponent.
	self
		compile: 'renderContent01On: html html div: [ ]'
		in: class.
	self
		compile: 'renderContent02On: html html div: [ html text: 2 ]'
		in: class.
	self
		compile: 'renderContent03On: html html div: [ html render: 3 ]'
		in: class.
	self
		compile: 'renderContent04On: html html div class: #foo; with: [ ]'
		in: class.
	self
		compile: 'renderContent05On: html html div class: #foo; with: [ html text: 5 ]'
		in: class.
	self
		compile: 'renderContent06On: html html div class: #foo; with: [ html render: 6 ]'
		in: class.
	self
		assertRule: WAUnnecessaryBlockPassedToBrushRule
		matches: { class>>#renderContent01On: . class>>#renderContent02On: . class>>#renderContent03On: . class>>#renderContent04On: . class>>#renderContent05On: . class>>#renderContent06On: }
]

{ #category : 'tests-parsetree' }
WASlimeTest >> testUnnecessaryWithSentToBrush [

	| class |
	class := self defineSubClassOf: #WAComponent.
	self
		compile: 'renderContentOn: html html div with: 123'
		in: class.
	self
		assertRule: WAUnnecessaryWithSentToBrushRule
		matches: { class>>#renderContentOn: }
]

{ #category : 'tests-parsetree' }
WASlimeTest >> testUsesWrongRenderer [

	| class |
	class := self defineSubClassOf: #WAComponent.
	self
		compile: 'renderContentOn: html
			html updater callback: [ :r | html div ]'
		in: class.
	self 
		assertRule: WAUsesWrongRendererRule
		matches: { class>>#renderContentOn: }
]

{ #category : 'tests-parsetree' }
WASlimeTest >> testWithHasToBeLastMessageInCascade [

	| class |
	class := self defineSubClassOf: #WAComponent.
	self
		compile: 'renderContent01On: html
			html div
				with: ''foo'';
				class: ''bar'''
		in: class.
	self
		compile: 'renderContent02On: html
			html div
				id: ''zork'';
				with: ''foo'';
				class: ''bar'''
		in: class.
	self 
		assertRule: WAWithHasToBeLastMessageInCascadeRule
		matches: { class>>#renderContent01On: . class>>#renderContent02On: }
]
