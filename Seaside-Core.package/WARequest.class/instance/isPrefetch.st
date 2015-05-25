testing
isPrefetch
	"Link prefetching is a browser mechanism, which utilizes browser idle time to download or prefetch documents that the user might visit in the near future. When the user visits one of the prefetched documents, it can be served up quickly out of the browser's cache."
	
	^ (self headerAt: 'x-moz') = 'prefetch'