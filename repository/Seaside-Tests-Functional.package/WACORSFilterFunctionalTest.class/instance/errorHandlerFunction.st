javascript
errorHandlerFunction

	^ (JSStream on: 'document.getElementById("result").style.backgroundColor = "Red"'), 
		(JSStream on: 'document.getElementById("result").innerHTML = "<p>Error</p>"') 
		  asFunction: #( 'result' )