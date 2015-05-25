converting-request
requestVersionFor: aNativeRequest
	| array |
	array := aNativeRequest httpVersion.
	^ WAHttpVersion major: array first minor: array second