attributes
turboPrefetch: aString
	"Prefetching links is enabled by default since Turbo v8, 
	but you can disable it by adding this meta tag to your page with value false."

	self name: 'turbo-prefetch'.
	self content: aString