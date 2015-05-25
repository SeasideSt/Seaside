item-optional
enclosure
	"Describes a media object that is attached to the item.
	
	It has three required attributes. url says where the enclosure is located, length says how big it is in bytes, and type says what its type is, a standard MIME type.
	
	The url must be an http url.
	
	e.g.:
	rss enclosure
		url: 'http://www.scripting.com/mp3s/weatherReportSuite.mp3';
		length: 12216320;
		type: 'audio/mpeg'"
	^ self brush: RREnclosureTag new