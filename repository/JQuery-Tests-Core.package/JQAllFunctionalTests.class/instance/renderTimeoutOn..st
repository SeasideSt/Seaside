rendering
renderTimeoutOn: html
	"Warn the user if an error occurs during an AJAX action (mostly this is a session timeout) and refreshes the current page (causing the default error/expiry handling to kick in)."

	html document addLoadScript: (html jQuery ajaxSetup
		onError: (html javascript
			alert: 'The session has expired.';
			refresh))
			
	"An alternative implementation is to trigger a request now and then so that the session never expires:"
	"html document addLoadScript: (html jQuery ajax
		callback: [ 'the session is active' ]; 
		interval: 60 seconds)"