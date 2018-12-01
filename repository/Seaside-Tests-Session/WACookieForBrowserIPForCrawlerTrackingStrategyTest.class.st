Class {
	#name : #WACookieForBrowserIPForCrawlerTrackingStrategyTest,
	#superclass : #WASessionTrackingStrategyTest,
	#category : 'Seaside-Tests-Session'
}

{ #category : #private }
WACookieForBrowserIPForCrawlerTrackingStrategyTest >> browserUserAgents [
	^ #(
		'Mozilla/5.0 (X11; U; Linux i586; de; rv:5.0) Gecko/20100101 Firefox/5.0'
		'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_7; da-dk) AppleWebKit/533.21.1 (KHTML, like Gecko) Version/5.0.5 Safari/533.21.1'
		'Opera/9.80 (X11; Linux x86_64; U; fr) Presto/2.9.168 Version/11.50'
		'Mozilla/5.0 (X11; Linux i686) AppleWebKit/535.1 (KHTML, like Gecko) Ubuntu/11.04 Chromium/14.0.825.0 Chrome/14.0.825.0 Safari/535.1'
		'Mozilla/5.0 (Windows; U; MSIE 9.0; Windows NT 9.0; en-US)'
		'Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 5.2; Trident/4.0; Media Center PC 4.0; SLCC1; .NET CLR 3.0.04320)'
		'Mozilla/5.0 (Windows; U; MSIE 7.0; Windows NT 6.0; en-US)'
		'Mozilla/5.0 (Windows; U; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)'
	)
]

{ #category : #private }
WACookieForBrowserIPForCrawlerTrackingStrategyTest >> crawlerUserAgents [
	^ #(
		'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'
		'Googlebot/2.1 (+http://www.google.com/bot.html)'
		'Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)'
		'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'
		'msnbot/2.1'
	)
]

{ #category : #private }
WACookieForBrowserIPForCrawlerTrackingStrategyTest >> newStrategy [
	^ WACookieForBrowserIPForCrawlerTrackingStrategy new
]

{ #category : #tests }
WACookieForBrowserIPForCrawlerTrackingStrategyTest >> testIsFromCrawler [
	| context |
	context := self requestContext.
	self crawlerUserAgents do: [ :each |
		context request headers at: 'user-agent' put: each.
		self assert: (strategy  isFromCrawler: context) ]
]

{ #category : #tests }
WACookieForBrowserIPForCrawlerTrackingStrategyTest >> testIsNotFromCrawler [
	| context |
	context := self requestContext.
	self browserUserAgents do: [ :each |
		context request headers at: 'user-agent' put: each.
		self deny: (strategy  isFromCrawler: context) ]
]
