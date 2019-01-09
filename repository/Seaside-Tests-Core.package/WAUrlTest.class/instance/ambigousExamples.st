testing-parsing
ambigousExamples
	"These examples consist of many edge cases that are sometimes not quite legal. The test assures that they no error is thrown and that they parse to something meaningful anyway."
	
	^ #( "scheme"
		 ( 'www.seaside.st' '/www.seaside.st' )
		 ( 'http://www.seaside.st:443/' 'http://www.seaside.st:443/' )
		 ( 'https://www.seaside.st:80/' 'https://www.seaside.st:80/' )
		
		 "port"
		 ( 'http://www.seaside.st:/' 'http://www.seaside.st/' )
		
		 "host"
		 ( 'http://' '/' )
		 ( 'http://@' '/' )
		
		 "username, password"
		 ( 'http://@www.seaside.st/' 'http://@www.seaside.st/' )
		 ( 'http://:lukas@www.seaside.st/' 'http://:lukas@www.seaside.st/' )
		 ( 'http://lukas:@www.seaside.st/' 'http://lukas:@www.seaside.st/' )
		
		 "path"
		 ( 'http://www.seaside.st' 'http://www.seaside.st/' )
		 ( 'http://www.seaside.st//' 'http://www.seaside.st/' )
		 ( 'http://www.seaside.st/.' 'http://www.seaside.st/' )
		 ( 'http://www.seaside.st/./' 'http://www.seaside.st/' )
		 ( 'http://www.seaside.st/..' 'http://www.seaside.st/' )
		 ( 'http://www.seaside.st/../' 'http://www.seaside.st/' )
		
		 "query"
		 ( 'http://www.seaside.st/?' 'http://www.seaside.st/' )
		 ( 'http://www.seaside.st/??' 'http://www.seaside.st/?%3F' )
		 ( 'http://www.seaside.st/?=2' 'http://www.seaside.st/' )
		 ( 'http://www.seaside.st/?&' 'http://www.seaside.st/' )
		 ( 'http://www.seaside.st/?1==' 'http://www.seaside.st/?1=%3D' )
		 ( 'http://www.seaside.st/?1=2&' 'http://www.seaside.st/?1=2' )
		 
		
		 "fragment"
		 ( 'http://www.seaside.st/#' 'http://www.seaside.st/' )
		 ( 'http://www.seaside.st/##' 'http://www.seaside.st/#%23' )
		 ( 'http://www.seaside.st/#?a=b' 'http://www.seaside.st/#%3Fa%3Db' ) )