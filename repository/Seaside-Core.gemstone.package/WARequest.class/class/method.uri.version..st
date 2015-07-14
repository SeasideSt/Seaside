instance creation
method: methodString uri: aUrlOrString version: aVersion
	^ self basicNew
		initializeWithMethod: methodString
			uri: aUrlOrString
			version: aVersion;
		yourself