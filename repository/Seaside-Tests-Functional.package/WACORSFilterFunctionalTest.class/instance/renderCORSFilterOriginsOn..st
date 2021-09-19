rendering-configuration
renderCORSFilterOriginsOn: html

	html heading
		level2;
		with: 'Currently allowed Origins:'.
	html paragraph
		id: 'allowed-origins';
		with:[
			self corsFilter allowedOrigins
				ifEmpty: [ html text: 'None' ]
				ifNotEmpty: [ :origins | html unorderedList list: origins ] ].

	html form: [ 
		html button
			callback: [ self corsFilter allowAnyOrigin ];
			with: 'Allow any origin'.

		html space.

		html button
			callback: [ 
				self corsFilter
					addAllowedOrigin: (self baseUrl asString allButLast) ];
			with: 'Allow other origin'.
		html space.

		html button
			callback: [ self corsFilter denyAllOrigins ];
			with: 'Deny all origins' ]