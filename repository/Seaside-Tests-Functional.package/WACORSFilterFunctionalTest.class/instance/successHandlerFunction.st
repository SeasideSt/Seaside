javascript
successHandlerFunction

	^ (JSStream on: 'console.log(arguments[0])') , (JSStream on:
		   'document.getElementById("result").style.backgroundColor = "darkgreen"')
	  , (JSStream on:
			   'document.getElementById("result").innerHTML = "<p>Success</p>"') 
		  asFunction: #( 'result' )