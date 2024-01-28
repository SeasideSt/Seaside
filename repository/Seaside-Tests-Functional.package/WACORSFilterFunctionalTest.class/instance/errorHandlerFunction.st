javascript
errorHandlerFunction

	^ (JSStream on: 'document.getElementById("result").style.backgroundColor = "Red"'), 
		(JSStream on: 'document.getElementById("result").innerHTML = "<p>Error</p>"'),
		(JSStream on: 'document.getElementById("result-contents").innerHTML = ""; response.text().then((text) => document.getElementById("result-contents").innerHTML += "<p>"+text+"</p>")')
		  asFunction: #( 'response' )