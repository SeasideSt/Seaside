options
evalJs: aBoolean
	"Automatically evals the content of Ajax.Response#responseText if the content-type returned by the server is one of the following: application/ecmascript, application/javascript, application/x-ecmascript, application/x-javascript, text/ecmascript, text/javascript, text/x-ecmascript, or text/x-javascript and the request obeys SOP. If you need to force evalutation, pass 'force'. To prevent it altogether, pass false."

	self options at: 'evalJS' put: aBoolean