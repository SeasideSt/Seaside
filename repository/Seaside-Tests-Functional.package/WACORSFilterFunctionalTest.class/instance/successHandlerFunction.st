javascript
successHandlerFunction

	^ (JSStream on: 'document.getElementById("result").style.backgroundColor = "DarkGreen"'),
		(JSStream on: 'document.getElementById("result").innerHTML = "<p>Success</p>"')
		  asFunction: #( 'result' )