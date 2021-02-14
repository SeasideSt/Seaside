"
I provide compatibility with old Seaside URLs that have Seaside in the path (eg. '/seaside/examples/counter') by simply removing it.
"
Class {
	#name : #WALegacyRedirectionHandler,
	#superclass : #WARequestHandler,
	#category : 'Seaside-Environment'
}

{ #category : #accessing }
WALegacyRedirectionHandler class >> description [
	^ 'Legacy redirection'
]

{ #category : #handling }
WALegacyRedirectionHandler >> handleFiltered: aRequestContext [
	| url |
	url := aRequestContext request url copy.
	url path removeFirst.
	aRequestContext respond: [ :response |
		response
			movedPermanently;
			location: url ]
]
