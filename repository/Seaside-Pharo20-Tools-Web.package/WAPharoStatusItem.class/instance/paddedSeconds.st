private
paddedSeconds
	^ (GRMappedPrinter 
		block: [ :time | time seconds ]
		next: (GRPrinter numberWithAtLeastDigits: 2)) , ' sec'