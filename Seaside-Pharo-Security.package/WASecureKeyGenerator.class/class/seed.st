private
seed
	fortuna := Fortuna key: (self generateKey: 32). "256 bits"
	sha1 := SecureRandom key: (self generateKey: 32)