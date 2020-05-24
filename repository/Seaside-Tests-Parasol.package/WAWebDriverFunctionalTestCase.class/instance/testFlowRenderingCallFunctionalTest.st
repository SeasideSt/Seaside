testing
testFlowRenderingCallFunctionalTest

	self selectTest: 'WAFlowRenderingCallFunctionalTest'.

	(driver findElementByPartialLinkText: 'This link') click.
	self assert: ((driver findElementByTagName: 'body') getText includesSubstring: 'You can only #call: and #answer: from within a callback or a Task')