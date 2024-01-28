javascript
errorHandlerFunction

	^ (JSStream on: 'document.getElementById("result").style.backgroundColor = "Red"'), 
		(JSStream on: 'document.getElementById("result").innerHTML = "<p>Error</p>"'),
		(JSStream on: 'result.text().then((text) => document.body.innerHTML += "<p>"+text+"</p>")')
		  asFunction: #( 'result' )