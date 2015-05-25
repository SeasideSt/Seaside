accessing
firstCookie
	^ self requestContext newCookie
		key: self firstKey;
		value: self firstValue;
		path: self firstPath;
		yourself