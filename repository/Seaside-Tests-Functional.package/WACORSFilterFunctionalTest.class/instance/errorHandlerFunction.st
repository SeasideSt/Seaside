javascript
errorHandlerFunction

	^ "(JSStream on: 'console.error(arguments[0])') , "(JSStream on:
		   'document.getElementById("result").style.backgroundColor = "red"')
	  , (JSStream on:
			   'document.getElementById("result").innerHTML = "<p>Error</p>"') 
		  asFunction: #( 'result' )