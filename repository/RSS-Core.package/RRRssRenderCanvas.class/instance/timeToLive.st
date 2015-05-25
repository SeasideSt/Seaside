channel-optional
timeToLive
	"It's a number of minutes that indicates how long a channel can be cached before refreshing from the source. This makes it possible for RSS sources to be managed by a file-sharing network such as Gnutella.
	
	e.g.: 60"
	^ self tag: 'ttl'