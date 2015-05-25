generation
redirectTo: aUrlOrString
	"Redirect to a new location."
	
	| oldCookies |
	"resetting the response also resets the cookies
	however in the case of a redirect we want to keep the cookies
	(for adding and deleting session cookies)"
	oldCookies := self response cookies.
	self ifResetPossible: [
		oldCookies do: [ :each |
			self response addCookie: each ].
		self response
			redirectTo: aUrlOrString ]