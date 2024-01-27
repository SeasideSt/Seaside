tests-block
testInstantiatesComponentWhileRendering

	| class |
	class := self 
		defineClass: #WASlimeMockComponent
		superclass: #WAComponent.
	self compile: 'renderContentOn: html html div: WAComponentStub new' in: class.
	self 
		assertRule: WAInstantiatesComponentWhileRenderingRule
		matches: { class>>#renderContentOn: }