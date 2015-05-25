options-generated
delay: anInteger
	"The delay in milliseconds the Autocomplete waits after a keystroke to activate itself. A zero-delay makes sense for local data (more responsive), but can produce a lot of load for remote data, while being less responsive."

	self optionAt: 'delay' put: anInteger