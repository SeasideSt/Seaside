rendering
renderJsonCallbackOn: html

	html paragraph: 'Load Json served by Seaside:'.
	html textArea id: 'textarea'.
	html document addLoadScript: 
		(html jQuery getJson 
				json: [:json | self seasidePackagesOn: json ];
				onSuccess: ((html jQuery id: 'textarea') value: (JSStream on: 'JSON.stringify(arguments[0])')) asFunction)
							