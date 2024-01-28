javascript
catchHandlerFunction

	^ (JSStream on: 'document.getElementById("result").style.backgroundColor = "Red"'), 
		(JSStream on: 'document.getElementById("result").innerHTML = "<p>CATCH "+error.name+"</p>"'),
		(JSStream on: 'document.getElementById("result-contents").innerHTML = ""')
		  asFunction: #( 'error' )