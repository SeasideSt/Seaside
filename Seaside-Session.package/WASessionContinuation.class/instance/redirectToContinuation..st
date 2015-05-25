private
redirectToContinuation: aSessionContinuation
	self respond: [ :response | response redirectTo: aSessionContinuation registerForUrl ]