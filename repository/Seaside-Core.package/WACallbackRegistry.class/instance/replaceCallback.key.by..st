registration
replaceCallback: oldCallback key: key by: newCallback

	callbacks removeKey: (oldCallback convertKey: key).
	oldCallback
		setKey: nil
		callbacks: nil.
	callbacks 
		at: (newCallback convertKey: key)
		put: newCallback.
	oldCallback
		setKey: key
		callbacks: self.
