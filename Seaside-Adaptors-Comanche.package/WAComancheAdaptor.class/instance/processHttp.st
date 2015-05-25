adapting
processHttp
	HttpResponse current: (self process: HttpRequest current).
	^ true