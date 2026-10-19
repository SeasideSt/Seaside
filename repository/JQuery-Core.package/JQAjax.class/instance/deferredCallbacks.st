private
deferredCallbacks
	^ deferredCallbacks ifNil: [ deferredCallbacks := OrderedCollection new ]