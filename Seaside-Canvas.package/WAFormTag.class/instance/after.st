private
after
	super after.
	self isGet ifTrue: [
		"Normally we have the session and continuation id in the action URL. However
		in the case of a GET <form> the browser will drop them."
		canvas div: [
			canvas actionUrl queryFields keysAndValuesDo: [ :k :v |
				canvas hiddenInput
					name: k;
					value: v ] ] ]