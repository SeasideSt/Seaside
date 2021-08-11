rendering
renderAdaptorSetupOn: html

	html paragraph:
		'This test needs to setup a separate Seaside server adaptor, to handle requests at a different host:port, in order to make requests cross-origin.'.

	html form: [ 
		html button
			callback: [ 
				WACORSResourceExample
					register;
					registerCorsAdaptor ];
			with: 'Register CORS Server adaptor' ]