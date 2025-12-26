rendering-configuration
renderCORSAllowedHeadersOn: html

	html heading
		level2;
		with: 'Currently allowed Headers.'.
	self corsFilter allowedHeaders
		ifEmpty: [ html text: 'None' ]
		ifNotEmpty: [ :allowed | html unorderedList list: allowed ].

	html form: [ 
		html button
			callback: [ 
				self corsFilter allowAllHeaders ];
			with: 'Allow all headers'.
		html space.

		html button
			callback: [ self corsFilter removeAllAllowedHeaders ];
			with: 'Remove all allowed headers' ]