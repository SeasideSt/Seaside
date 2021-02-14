"
I demonstrate how to use Seaside-REST to resume WARestCounter once a session has expired.
"
Class {
	#name : #WARestCounterStarter,
	#superclass : #WARestfulComponentFilter,
	#category : 'Seaside-REST-Examples'
}

{ #category : #routes }
WARestCounterStarter >> count: count [
	<get>
	<path: '/{count}'>
	"We could also use
	
	WARestCounter new
		initialRequest: (self requestContext request);
		yourself
	
	and implement WARestCounter >> #initialRequest:
	
	But then we would have to 'manually' parse the request in #initialRequest:.
	It's much more convenient this way."
	self startSessionWithRoot: (WARestCounter new
		count: count greaseInteger;
		yourself)
]
