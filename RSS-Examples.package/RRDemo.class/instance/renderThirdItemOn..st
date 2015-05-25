rendering
renderThirdItemOn: rss
	rss item: [
		rss title: 'The Engine That Does More'.
		rss author: (WAEmailAddress address: 'joesmith@example.com' username: 'Joe Smith').
		rss link: 'http://liftoff.msfc.nasa.gov/news/2003/news-VASIMR.asp'.
		rss description: 'Before man travels to Mars, NASA hopes to design new engines that will let us fly through the Solar System more quickly.  The proposed VASIMR engine would do that.'.
		rss publicationDate: (RRRfc822DateTime dateAndTime: self thirdPublicationDate timeZoneString: 'EST').
		rss guid: 'http://liftoff.msfc.nasa.gov/2003/05/27.html#item571' ]