support
startBackgroundTask
	"enclosed in a transaction as later we abort the transaction repeatedly while we check to see 
	if the service gem has completed our task. Without a transaction the value might not be
	set as the abort will revert to it's prior unassigned state." 
	GRPlatform current doTransaction: [
		backgroundTask := [ 
			| timeInLondon |
			"should extact the time from the html; not the most robust parsing algorithmn"
			timeInLondon := (HTTPSocket httpGet: 'http://www.time.org/zones/Europe/London.php') throughAll:  'Europe/London - '; upTo: Character space.
			'(from http://www.time.org), time in London is: ', timeInLondon ] serverBackgroundTask ].