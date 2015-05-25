comparing
hash
	^ (self mimeType hash
		bitXor: self fileName hash)
		bitXor: self contents hash