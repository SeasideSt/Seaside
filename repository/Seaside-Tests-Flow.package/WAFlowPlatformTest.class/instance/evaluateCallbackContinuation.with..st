private
evaluateCallbackContinuation: aContinuation with: anObject
	| callback |
	callback := WAActionCallback new.
	callback block: [ aContinuation value: anObject ].
	[ callback evaluateWithArgument: nil ]
		on: WARenderNotification do: [ :n | ]