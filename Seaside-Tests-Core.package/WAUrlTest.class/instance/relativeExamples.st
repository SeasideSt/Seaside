testing-parsing
relativeExamples
	^ #( ( 'http://www.seaside.st/foo' '' 'http://www.seaside.st/foo' )
		 ( 'http://www.seaside.st/foo' '.' 'http://www.seaside.st/foo' )
		 ( 'http://www.seaside.st/foo' './bar' 'http://www.seaside.st/foo/bar' )
		 ( 'http://www.seaside.st/foo' 'bar' 'http://www.seaside.st/foo/bar' )
		 ( 'http://www.seaside.st/foo' 'bar/.' 'http://www.seaside.st/foo/bar' )
		 ( 'http://www.seaside.st/foo' 'bar/..' 'http://www.seaside.st/foo' )
		 ( 'http://www.seaside.st/foo' 'bar/../..' 'http://www.seaside.st/' )
		 ( 'http://www.seaside.st/foo' 'bar/../../..' 'http://www.seaside.st/' )

		 ( 'http://www.seaside.st/foo' '/' 'http://www.seaside.st/' )
		 ( 'http://www.seaside.st/foo' '/.' 'http://www.seaside.st/' )
		 ( 'http://www.seaside.st/foo' '/./bar' 'http://www.seaside.st/bar' )
		 ( 'http://www.seaside.st/foo' '/bar' 'http://www.seaside.st/bar' )
		 ( 'http://www.seaside.st/foo' '/bar/.' 'http://www.seaside.st/bar' )
		 ( 'http://www.seaside.st/foo' '/bar/..' 'http://www.seaside.st/' )
		 ( 'http://www.seaside.st/foo' '/bar/../..' 'http://www.seaside.st/' )
		 ( 'http://www.seaside.st/foo' '/bar/../../..' 'http://www.seaside.st/' ) )