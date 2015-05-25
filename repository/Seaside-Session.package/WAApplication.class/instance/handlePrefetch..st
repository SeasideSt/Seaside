private
handlePrefetch: aRequestContext
	"Mozilla prefetches some <link> elements:
	https://developer.mozilla.org/en/Link_prefetching_FAQ
	This usally isn't a problem as long as they are used for style sheets.
	It is however a problem when they are used for navigational 'Index', 'Next', and 'Prev'
	See the following bug:
	http://code.google.com/p/pier/issues/detail?id=132
	
	Disabling has the disadvantage that we also disable prefech of things that would support prefetching
	(like style sheets). However we don't recommend to have Seaside serving these in production.
	
	We are not actually sure whether 403 Forbidden is the correct way to indicate that we don't support prefetching.
	Ohter options would include:
		- 412 Precondition Failed, user agent has to try different headers (seems fitting, however seems to be also about entity header)
		- 405 Method Not Allowed, but this is about HTTP methods and we must send Allow containg the valid methods
		
	We don't go through the response generator because the user will never see the response
	so it doesn't make sense to customize the contents."
	aRequestContext respond: [ :response |
		response forbidden ]