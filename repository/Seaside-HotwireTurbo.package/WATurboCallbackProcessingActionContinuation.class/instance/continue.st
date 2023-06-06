actions
continue
	self requestContext request isTurboFrameRequest
		ifTrue: [ "WARenderTurboFrameNotification signal"
				self requestContext respond: [ :response |
					response
						doNotCache;
						contentType: self application contentType.
					self renderTurboFrameResponseOn: response stream ] ]
		ifFalse: [ super continue ]