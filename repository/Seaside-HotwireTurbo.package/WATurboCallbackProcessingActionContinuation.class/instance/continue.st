actions
continue
	| renderContinuation |
	self shouldRedirect
		ifTrue: [ 
			"TODO: Creating a new render continuation here... is overkill at least and maybe wrong?"
			renderContinuation := self createRenderContinuation.
			self redirectToContinuation: renderContinuation.
			^ self ].
	self requestContext request isTurboFrameRequest
		ifTrue: [ "WARenderTurboFrameNotification signal"
				self requestContext respond: [ :response |
					response
						doNotCache;
						contentType: self application contentType.
					self renderTurboFrameResponseOn: response stream ] ]
		ifFalse: [ super continue ]