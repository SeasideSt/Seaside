tests
testIsInternetExplorer
	self assertUserAgent: 'Mozilla/5.0 (compatible; Konqueror/3.2; Linux 2.6.2) (KHTML, like Gecko)' isInternetExplorer: false.
	self assertUserAgent: 'Mozilla/4.0 (compatible; MSIE 6.0; MSIE 5.5; Windows NT 5.1) Opera 7.04 [de]' isInternetExplorer: false.
	self assertUserAgent: 'Opera/9.10 (Windows NT 5.0; U; de)' isInternetExplorer: false.
	self assertUserAgent: 'Mozilla/5.0 (Windows; U; Windows NT 5.0; de-DE; rv:1.6) Gecko/20040206 Firefox/1.0.1' isInternetExplorer: false.
	self assertUserAgent: 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506)' isInternetExplorer: true.
	self assertUserAgent: 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)' isInternetExplorer: true.
	self assertUserAgent: 'Lynx/2.8.4rel.1 libwww-FM/2.14 SSL-MM/1.4.1 OpenSSL/0.9.6c' isInternetExplorer: false.
	self assertUserAgent: 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de-AT; rv:1.8.1.2) Gecko/20070222 SeaMonkey/1.1.1' isInternetExplorer: false.
	self assertUserAgent: 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.8.1.3) Gecko/20070309 Firefox/2.0.0.3' isInternetExplorer: false