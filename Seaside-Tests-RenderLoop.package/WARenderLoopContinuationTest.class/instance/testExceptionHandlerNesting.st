tests
testExceptionHandlerNesting
	| continuation handler |
	continuation := WARenderLoopContinuation new.
	handler := WASignalingErrorHandler new.
	self
		shouldnt:  [
			handler handleExceptionsDuring: [
				continuation withNotificationHandlerDo: [
					WAError signal: 'Testing 1, 2, 3' ] ] ]
		raise: WARenderNotification