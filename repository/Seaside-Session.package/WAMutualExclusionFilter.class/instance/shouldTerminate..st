private
shouldTerminate: aRequestContext
	^ (aRequestContext request fields includesKey: 'terminate')
		and: [ aRequestContext application preferenceAt: #sessionAllowTermination ]