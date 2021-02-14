Class {
	#name : #RRDemo,
	#superclass : #RRComponent,
	#category : 'RSS-Examples'
}

{ #category : #testing }
RRDemo class >> canBeRoot [
	^ true
]

{ #category : #accessing }
RRDemo class >> description [
	^ 'RSS Demo'
]

{ #category : #'class initialization' }
RRDemo class >> initialize [
	(WAAdmin register: RRRssHandler at: 'examples/demo.rss')
		rootComponentClass: self
]

{ #category : #private }
RRDemo >> firstPublicationDate [
	^ DateAndTime
		year: 2003
		month: 6
		day: 3
		hour: 9
		minute: 39
		second: 21
]

{ #category : #private }
RRDemo >> fourthPublicationDate [
	^ DateAndTime
		year: 2003
		month: 5
		day: 20
		hour: 8
		minute: 56
		second: 02
]

{ #category : #rendering }
RRDemo >> renderChannelOn: rss [
	rss title: 'Liftoff News'.
	rss link: 'http://liftoff.msfc.nasa.gov/'.
	rss description: 'Liftoff to Space Exploration.'.
	rss language englishUnitedStates.
	rss publicationDate: 'Tue, 10 Jun 2003 04:00:00 GMT'.
	rss lastBuildDate: 'Tue, 10 Jun 2003 09:41:01 GMT'.
	rss defaultDocumentation.
	rss generator: 'Weblog Editor 2.0'.
	rss managingEditor: 'editor@example.com'.
	rss webMaster: 'webmaster@example.com'
]

{ #category : #rendering }
RRDemo >> renderContentOn: rss [
	self renderChannelOn: rss.
	self renderFirstItemOn: rss.
	self renderSecondItemOn: rss.
	self renderThirdItemOn: rss.
	self renderFourthtemOn: rss
]

{ #category : #rendering }
RRDemo >> renderFirstItemOn: rss [
	rss item: [
		rss title: 'Star City'.
		rss author: 'joesmith@example.com (Joe Smith)'.
		rss link: 'http://liftoff.msfc.nasa.gov/news/2003/news-starcity.asp'.
		rss description: 'How do Americans get ready to work with Russians aboard the International Space Station? They take a crash course in culture, language and protocol at Russia''s Star City.'.
		rss publicationDate: (RRRfc822DateTime newDateAndTime: self firstPublicationDate).
		rss guid: 'http://liftoff.msfc.nasa.gov/2003/06/03.html#item573' ]
]

{ #category : #rendering }
RRDemo >> renderFourthtemOn: rss [
	rss item: [
		rss title: 'Astronauts'' Dirty Laundry'.
		rss author: (WAEmailAddress address: 'joesmith@example.com').
		rss link: 'http://liftoff.msfc.nasa.gov/news/2003/news-laundry.asp'.
		rss description: 'Compared to earlier spacecraft, the International Space Station has many luxuries, but laundry facilities are not one of them. Instead, astronauts have other options.'.
		rss publicationDate: 'Tue, 20 May 2003 08:56:02 GMT'.
		rss guid: 'http://liftoff.msfc.nasa.gov/2003/05/20.html#item570' ]
]

{ #category : #rendering }
RRDemo >> renderSecondItemOn: rss [
	rss item: [
		rss title: 'Space Exploration'.
		rss author: 'Joe Smith <joesmith@example.com>'.
		rss link: 'http://liftoff.msfc.nasa.gov/'.
		rss description: 'Sky watchers in Europe, Asia, and parts of Alaska and Canada will experience a partial eclipse of the Sun on Saturday, May 31st.'.
		rss publicationDate: (RRRfc822DateTime newUtc: self secondPublicationDate).
		rss guid: 'http://liftoff.msfc.nasa.gov/2003/05/30.html#item572' ]
]

{ #category : #rendering }
RRDemo >> renderThirdItemOn: rss [
	rss item: [
		rss title: 'The Engine That Does More'.
		rss author: (WAEmailAddress address: 'joesmith@example.com' username: 'Joe Smith').
		rss link: 'http://liftoff.msfc.nasa.gov/news/2003/news-VASIMR.asp'.
		rss description: 'Before man travels to Mars, NASA hopes to design new engines that will let us fly through the Solar System more quickly.  The proposed VASIMR engine would do that.'.
		rss publicationDate: (RRRfc822DateTime dateAndTime: self thirdPublicationDate timeZoneString: 'EST').
		rss guid: 'http://liftoff.msfc.nasa.gov/2003/05/27.html#item571' ]
]

{ #category : #private }
RRDemo >> secondPublicationDate [
	^ DateAndTime
		year: 2003
		month: 5
		day: 30
		hour: 11
		minute: 6
		second: 42
]

{ #category : #private }
RRDemo >> thirdPublicationDate [
	^ DateAndTime
		year: 2003
		month: 5
		day: 27
		hour: 8
		minute: 37
		second: 32
]
