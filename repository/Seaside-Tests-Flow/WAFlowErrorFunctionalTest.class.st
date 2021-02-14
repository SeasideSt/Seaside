Class {
	#name : #WAFlowErrorFunctionalTest,
	#superclass : #WAExceptionFunctionalTest,
	#category : 'Seaside-Tests-Flow-Functional'
}

{ #category : #rendering }
WAFlowErrorFunctionalTest >> renderErrorWithCallOn: html [ 
	html heading: 'Error in a called component'.
	html paragraph: 'A message should be displayed. Once you click the button, behaviour should be identical to the Error case above without a call. If not, we may have a problem with continuations holding onto the request context.'.
	html anchor
		callback: [ self inform: 'Once you close this, an error will be raised.'. self raiseError ];
		with: 'Raise error'
]

{ #category : #rendering }
WAFlowErrorFunctionalTest >> renderPartsOn: html [
	self renderErrorOn: html.
	self renderErrorWithCallOn: html
]
