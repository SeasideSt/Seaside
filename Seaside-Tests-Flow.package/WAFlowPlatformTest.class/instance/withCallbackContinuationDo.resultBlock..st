private
withCallbackContinuationDo: ccBlock resultBlock: resultBlock 
	| callback |
	callback := WAActionCallback new.
	callback block: [ resultBlock value: (GRPlatform current seasideSuspendFlowDo: ccBlock) ].
	[ callback evaluateWithArgument: nil ] 
		on: WARenderNotification
		do: [ :n |  ]