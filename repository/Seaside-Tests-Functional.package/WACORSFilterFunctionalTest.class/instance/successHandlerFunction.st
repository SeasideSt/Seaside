javascript
successHandlerFunction

	^ (JSStream on: 'document.getElementById("result").style.backgroundColor = "DarkGreen"'),
		(JSStream on: 'document.getElementById("result").innerHTML = "<p>Success</p>"'),
		(JSStream on: 'result.text().then((text) => document.body.innerHTML += "<p>"+text+"</p>")')
		  asFunction: #( 'result' )