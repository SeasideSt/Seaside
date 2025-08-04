rendering-configuration
renderCORSFilterOriginsOn: html

	html heading
		level2;
		with: 'Currently allowed Origins:'.
	html paragraph
		id: 'allowed-origins';
		with:[
			self corsFilter allowedOrigin
				ifNil: [ html text: 'None' ]
				ifNotNil: [ :origin | html text: origin ] ].

	html form: [ 
		html button
			callback: [ self corsFilter allowAnyOrigin ];
			with: 'Allow any origin'.

		html space.

		html button
			callback: [ 
				self corsFilter
					allowedOrigin: (self baseUrl greaseString allButLast) ];
			with: 'Allow other origin'.
		html space.

		html button
			callback: [ self corsFilter denyAllOrigins ];
			with: 'Deny all origins' ]