private
verifyPassword: aPasswordString forUser: aUserString
	^ aUserString = 'admin' and: [ aPasswordString = 'seaside' ]