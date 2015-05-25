accessing
secondCookie
	^ self requestContext newCookie
		key: self secondKey;
		value: self secondValue;
		path: self secondPath;
		yourself