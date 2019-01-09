accessing
configuration

	^ self handler ifNotNil: [:h | h configuration]