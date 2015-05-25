private
unitDictionary
	^ Dictionary new
		at: 1 put: 'bytes';
		at: 1024 put: 'KiB';
		at: 1024 squared put: 'MiB';
		at: (1024 raisedTo: 3) put: 'GiB';
		yourself