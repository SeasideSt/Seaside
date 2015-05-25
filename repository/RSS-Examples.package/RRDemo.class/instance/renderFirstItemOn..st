rendering
renderFirstItemOn: rss
	rss item: [
		rss title: 'Star City'.
		rss author: 'joesmith@example.com (Joe Smith)'.
		rss link: 'http://liftoff.msfc.nasa.gov/news/2003/news-starcity.asp'.
		rss description: 'How do Americans get ready to work with Russians aboard the International Space Station? They take a crash course in culture, language and protocol at Russia''s Star City.'.
		rss publicationDate: (RRRfc822DateTime newDateAndTime: self firstPublicationDate).
		rss guid: 'http://liftoff.msfc.nasa.gov/2003/06/03.html#item573' ]