private
paddedMinutes
	^ (GRMappedPrinter 
		block: [ :time | time minutes ]
		next: (GRNumberPrinter new padding: $0; digits: 2)) , ' min '