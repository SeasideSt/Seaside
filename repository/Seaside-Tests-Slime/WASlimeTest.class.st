Class {
	#name : #WASlimeTest,
	#superclass : #GRSlimeTest,
	#category : 'Seaside-Tests-Slime'
}

{ #category : #'tests-block' }
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
		runRule: WACallSuperImplementationRule
		selectors: #(postCopy updateRoot:)
]

{ #category : #'tests-block' }
WASlimeTest >> testChangesStateWhileRendering [
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	class addInstanceVariable: 'foo'.
	self compile: 'renderContentOn: html html div: [ foo := nil ]' in: class.
	self 
		runRule: WAChangesStateWhileRenderingRule
		selectors: #(renderContentOn:)
]

{ #category : #'tests-transform' }
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

{ #category : #'tests-block' }
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
		runRule: WADoNotCombineMultiplePrimaryAjaxCallbacks
		selectors: #(scriptOn: scriptOn2: scriptOn3: scriptOn4:)
]

{ #category : #'tests-block' }
WASlimeTest >> testDoNotUseWhileRendering [
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	self compile: 'renderContentOn: html html div: [ self call: nil ]' in: class.
	self 
		runRule: WADoNotUseWhileRenderingRule
		selectors: #(renderContentOn:)
]

{ #category : #'tests-block' }
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
		runRule: WADoNotUseWithinCallbackRule
		selectors: #(renderContentOn:)
]

{ #category : #'tests-parsetree' }
WASlimeTest >> testExtractCallbackCodeToMethod [
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	class
		compile: 'renderInvalidOn: html
			html anchor 
				callback: [ self foo. self bar ];
				with: 1'
		classified: #(rendering).
	class
		compile: 'renderValidOn: html
			html anchor 
				callback: [ self foo ];
				with: 1'
		classified: #(rendering).
	self 
		runRule: WAExtractCallbackCodeToMethodRule
		selectors: #(renderInvalidOn:)
]

{ #category : #'tests-parsetree' }
WASlimeTest >> testFixCallbackTempsMissing [
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	self
		compile: 'callbackTemps | r | r := OrderedCollection new. (1 to: 10) do: [ :e | r add: [ e ] ]' 
		in: class.
	self 
		runRule: WAFixCallbackTempsMissingRule
		selectors: #(callbackTemps)
]

{ #category : #'tests-transform' }
WASlimeTest >> testHandleRequestRule [
	| class |
	class := self
		defineClass: #WASlimeMockHandler
		superclass: #WARequestHandler.
	self compile: 'handleRequest: aRequest aRequest notFound' in: class.
	self 
		runTransformation: WAHandleRequestRule
		changes: #('handleFiltered: aRequestContext aRequestContext request notFound')
]

{ #category : #'tests-block' }
WASlimeTest >> testInstantiatesComponentWhileRendering [
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	self compile: 'renderContentOn: html html div: WAComponentStub new' in: class.
	self 
		runRule: WAInstantiatesComponentWhileRenderingRule
		selectors: #(renderContentOn:)
]

{ #category : #'tests-parsetree' }
WASlimeTest >> testSendsRenderContentOn [
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	class
		compile: 'invalid self renderContentOn: nil'
		classified: #(rendering).
	self 
		runRule: WASendsRenderContentOnRule
		selectors: #(invalid)
]

{ #category : #'tests-parsetree' }
WASlimeTest >> testSequencedAsynchronousCalls [
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	class
		compile: 'renderContent1On: html
			html div
				onClick: (html jQuery ajax callback: [  ]) , (html jQuery ajax serializeForm);
				with: ''Click me'''
		classified: #(rendering).
	class
		compile: 'renderContent2On: html
			html div
				onClick: (html jQuery ajax serializeForm; callback: [  ]) , (html jQuery effect bounce);
				with: ''Click me'''
		classified: #(rendering).
	self 
		runRule: WASequencedAsynchronousCallsRule
		selectors: #(renderContent1On: renderContent2On:)
]

{ #category : #'tests-transform' }
WASlimeTest >> testSessionExpiredRule [
	| class |
	class := self
		defineClass: #WASlimeMockSession
		superclass: #WASession.
	self compile: 'expired self cleanup' in: class.
	self 
		runTransformation: WASessionExpiredRule
		changes: #('unregistered self cleanup')
]

{ #category : #'tests-parsetree' }
WASlimeTest >> testUnnecessaryBlockPassedToBrush [
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	class
		compile: 'renderContent01On: html html div: [ ]'
		classified: #(rendering).
	class
		compile: 'renderContent02On: html html div: [ html text: 2 ]'
		classified: #(rendering).
	class
		compile: 'renderContent03On: html html div: [ html render: 3 ]'
		classified: #(rendering).
	class
		compile: 'renderContent04On: html html div class: #foo; with: [ ]'
		classified: #(rendering).
	class
		compile: 'renderContent05On: html html div class: #foo; with: [ html text: 5 ]'
		classified: #(rendering).
	class
		compile: 'renderContent06On: html html div class: #foo; with: [ html render: 6 ]'
		classified: #(rendering).
	self
		runRule: WAUnnecessaryBlockPassedToBrushRule
		selectors: #(renderContent01On: renderContent02On: renderContent03On: renderContent04On: renderContent05On: renderContent06On:)
]

{ #category : #'tests-parsetree' }
WASlimeTest >> testUnnecessaryWithSentToBrush [
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	class
		compile: 'renderContentOn: html html div with: 123'
		classified: #(rendering).
	self
		runRule: WAUnnecessaryWithSentToBrushRule
		selectors: #(renderContentOn:)
]

{ #category : #'tests-parsetree' }
WASlimeTest >> testUsesWrongRenderer [
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	class
		compile: 'renderContentOn: html
			html updater callback: [ :r | html div ]'
		classified: #(rendering).
	self 
		runRule: WAUsesWrongRendererRule
		selectors: #(renderContentOn:)
]

{ #category : #'tests-parsetree' }
WASlimeTest >> testWithHasToBeLastMessageInCascade [
	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	class
		compile: 'renderContent01On: html
			html div
				with: ''foo'';
				class: ''bar'''
		classified: #(rendering).
	class
		compile: 'renderContent02On: html
			html div
				id: ''zork'';
				with: ''foo'';
				class: ''bar'''
		classified: #(rendering).
	self 
		runRule: WAWithHasToBeLastMessageInCascadeRule
		selectors: #(renderContent01On: renderContent02On:)
]
