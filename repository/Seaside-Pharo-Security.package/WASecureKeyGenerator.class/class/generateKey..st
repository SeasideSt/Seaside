private
generateKey: keySize
	^ FileStream oldFileNamed: self seedFile do: [ :stream |
		stream binary; next: keySize ]