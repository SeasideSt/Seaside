accessing
rationale
	^ 'AJAX calls are asynchronous by default and they immediately return. Therefor it is a bug in most cases if an AJAX call is followed by other actions. If there are multiple AJAX calls try to combine them into one that is also more, or alternatively start the next request once the first one has completed.'