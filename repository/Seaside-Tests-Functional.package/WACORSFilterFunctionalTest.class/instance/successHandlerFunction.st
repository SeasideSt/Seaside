javascript
successHandlerFunction

	^ (JSStream on: 'document.getElementById("result").style.backgroundColor = "DarkGreen"'),
		(JSStream on: 'document.getElementById("result").innerHTML = "<p>Success</p>"'),
		(JSStream on: 'document.getElementById("result-contents").innerHTML = ""; response.text().then((text) => document.getElementById("result-contents").innerHTML += "<p>"+text+"</p>")')
		  asFunction: #( 'response' )