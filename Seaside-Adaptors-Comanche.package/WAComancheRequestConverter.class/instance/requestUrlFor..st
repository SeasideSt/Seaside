converting-request
requestUrlFor: aNativeRequest
	^ (WAUrl absolute: aNativeRequest rawUrl)
		decodedWith: self codec