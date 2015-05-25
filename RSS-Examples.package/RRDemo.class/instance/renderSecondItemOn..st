rendering
renderSecondItemOn: rss
	rss item: [
		rss title: 'Space Exploration'.
		rss author: 'Joe Smith <joesmith@example.com>'.
		rss link: 'http://liftoff.msfc.nasa.gov/'.
		rss description: 'Sky watchers in Europe, Asia, and parts of Alaska and Canada will experience a partial eclipse of the Sun on Saturday, May 31st.'.
		rss publicationDate: (RRRfc822DateTime newUtc: self secondPublicationDate).
		rss guid: 'http://liftoff.msfc.nasa.gov/2003/05/30.html#item572' ]