private
asAbsoluteUrl: aFileName relativeTo: aRequest
	^aRequest url withoutQuery
		addToPath: aFileName;
		yourself