options
frequency: aDuration
	"Okay, this is not a frequency (e.g 0.5Hz), but a period (i.e. a number of seconds). Don't kill me, I didn't write this one! This is the minimum interval at which AJAX requests are made. You don't want to make it too short (otherwise you may very well end up with multiple requests in parallel, if they take longer to process and return), but you technically can provide a number below one, e.g. 0.75 second."

	self options at: 'frequency' put: aDuration