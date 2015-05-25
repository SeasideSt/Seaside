rendering
renderContentOn: html

	html div id: #header; with: [ 
		html div class:'swagger ui-wrap'; with:[
			html anchor id: #logo; url: 'http://swagger.io'; with: 'swagger'.
			html form id: 'api_selector'; with:[
				html div class:'input'; with:[ html textInput placeholder:'http://example.com/api'; id:'input_baseUrl'; name:'baseUrl' ].
				html div class:'input'; with:[ html textInput placeholder:'api_key'; id:'input_apiKey'; name:'apiKey' ].	
				html div class:'input'; with:[ html anchor url: '#'; id: 'explore'; with: 'Explore' ] 
				]
			]
		].
	html div id:	'message-bar'; class: 'swagger-ui-wrap'; with: [ html space ].
	html div id:	'swagger-ui-container'; class: 'swagger-ui-wrap'; with: [ html space ]