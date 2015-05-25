rendering
renderErrorOn: html 
	html heading: 'Error'.
	html paragraph: 'Behaviour is exception-handler-dependent. If a Debugger is opened, closing the debugger window should at least result in the socket being closed and should not lock the session. Proceeding from the Debugger should be handled gracefully but behaviour is platform-dependent. On Pharo and GemStone, you should see an error page in the browser. On VW, you should see a message indicating that nil was returned.'.
	html anchor
		callback: [ self raiseError ];
		with: 'Raise error'