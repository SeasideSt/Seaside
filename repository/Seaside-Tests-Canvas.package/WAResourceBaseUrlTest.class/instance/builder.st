private
builder
	^ super builder
		resourceUrl: (WAUrl absolute: self resourceBaseUrl);
		yourself