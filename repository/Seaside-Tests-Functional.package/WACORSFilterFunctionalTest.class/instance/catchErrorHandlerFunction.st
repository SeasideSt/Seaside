javascript
catchErrorHandlerFunction

	^ (JSStream on: 'document.getElementById("result").style.backgroundColor = "Red"'), 
		(JSStream on: 'document.getElementById("result").innerHTML = "<p>Catch Error</p>"') 
		  asFunction: #( 'result' )