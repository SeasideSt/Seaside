testing-parsing
equalExamples
	"These examples about URI equivalence come from Sam Ruby and are quite hardcore. Java and Perl fail them, C# passes them.
	http://intertwingly.net/blog/2004/07/31/URI-Equivalence"
	
	^ #( 
		 ( 'http://example.com/'				'http://example.com' )
		 ( 'http://example.com/' 				'HTTP://example.com/' )
		 ( 'http://example.com/' 				'http://example.com:/' )
		 ( 'http://example.com/' 				'http://example.com:80/' )
		 ( 'http://example.com/' 				'http://Example.com/' )
		 ( 'http://example.com/~smith/'		'http://example.com/%7Esmith/' )
		 ( 'http://example.com/~smith/'		'http://example.com/%7esmith/' )
		 ( 'http://example.com/%7Esmith/'	'http://example.com/%7esmith/' )
		 ( 'http://example.com/foo/bar/'		'http://example.com/foo//bar/' )
		 ( 'http://example.com/foo/bar/'		'http://example.com/foo////bar/' )
			
		"The following example requires Unicode normalization, something that probably only GemStone/S 3.2+ is able to perform.
		 ( 'http://example.com/%C3%87'		'http://example.com/C%CC%A7' )" )