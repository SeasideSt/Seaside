tests-transform
testSessionExpiredRule
	| class |
	class := self
		defineClass: #WASlimeMockSession
		superclass: #WASession.
	self compile: 'expired self cleanup' in: class.
	self 
		runTransformation: WASessionExpiredRule
		changes: #('unregistered self cleanup')