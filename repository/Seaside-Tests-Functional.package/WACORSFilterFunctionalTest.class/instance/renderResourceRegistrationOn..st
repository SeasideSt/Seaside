rendering
renderResourceRegistrationOn: html

	html paragraph:
		('This test needs REST request handler located at <1p>.' 
			 expandMacrosWith: WACORSResourceExample resourceUrl).
	html form: [ 
		html button
			callback: [ WACORSResourceExample register ];
			with: 'Register CORS Resource' ]