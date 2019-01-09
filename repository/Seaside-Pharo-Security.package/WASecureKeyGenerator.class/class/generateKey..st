private
generateKey: keySize
	^ GRPlatform current fileStreamOn: self seedFile do:[ :stream | stream next: keySize] binary: true