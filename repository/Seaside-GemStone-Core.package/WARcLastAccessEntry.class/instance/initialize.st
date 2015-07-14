initialization
initialize

	time := Time totalSeconds.
	counter := 
		(RcCounter new: 1000)
			increment;
			yourself.
	lastCount := 0.