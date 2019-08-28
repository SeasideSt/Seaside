private
cookieCheckUrlFor: aRequestContext
	^ aRequestContext request url copy
			addField: self application trackingStrategy keyField value: self session key;
			addField: 'cookiecheck'; 
			yourself