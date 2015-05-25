configuration
createHandlers
	| application session |
	application := WAApplication new
		cache: WAPredictableCache new;
		yourself.
	session := WASession new
		cache: WAPredictableCache new;
		yourself.
	application register: session.
	^ Array
		with: application
		with: session