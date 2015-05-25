configuration
tests
	^ Array 
		with: 'Ajax' -> (Array 
			with: 'Ajax' -> JQAjaxFunctionalTest new
			with: 'Form' -> JQFormFunctionalTest new
			with: 'Request' -> JQRequestFunctionalTest new
			with: 'JSON' -> JQJsonFunctionalTest new
			with: 'Counter' -> JQCounterFunctionalTest new
			with: 'Repeating' -> JQRepeatingFunctionalTest new)
		with: 'Other' -> (Array
			with: 'Effect' -> JQEffectsFunctionalTest new
			with: 'Animate' -> JQAnimateFunctionalTest new)