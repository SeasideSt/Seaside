class initialization
initializeJsonTable
	table := ByteArray new: 256 withAll: 0.
	0 to: 31 do: [ :index | 
		table 
			at: index + 1
			put: 1 ].
	table at: $" greaseInteger + 1 put: 1.
	table at: $\ greaseInteger + 1 put: 1