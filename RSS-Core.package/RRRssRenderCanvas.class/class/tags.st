accessing-tags
tags
	"
	self generateTags
	"

	^ #(
		('item' item item: 'item')
	
		('title' title title: 'channel-required')
		('link' link link: 'channel-required')
		('description' description description: 'channel-required')

		
		('language' language language: 'channel-optional')
		('copyright' copyright copyright: 'channel-optional')
		('managingEditor' managingEditor managingEditor: 'channel-optional')
		('webMaster' webMaster webMaster: 'channel-optional')
		('pubDate' publicationDate publicationDate: 'channel-optional')
		('lastBuildDate' lastBuildDate lastBuildDate: 'channel-optional')
		('category' category category: 'channel-optional')
		('generator' generator generator: 'channel-optional')
		('docs' documentation documentation: 'channel-optional')
		('cloud' cloud cloud: 'channel-optional')
		('ttl' timeToLive timeToLive: 'channel-optional')
		('image' image image: 'channel-optional')
		('rating' rating rating: 'channel-optional')
		('textInput' textInput textInput: 'channel-optional')
		('skipHours' skipHours skipHours: 'channel-optional')
		('skipDays' skipDays skipDays: 'channel-optional')
		
		('author' author author: 'item-optional')
		('comments' comments comments: 'item-optional')
		('enclosure' enclosure enclosure: 'item-optional')
		('guid' guid guid: 'item-optional')
		('source' source source: 'item-optional')
		('language' language language: 'item-optional')
		
		('width' width width: 'image-optional')
		('height' height height: 'image-optional')
		
		('name' name name: 'textinput-required')
		
		('hour' hour hour: 'skipHours')
		('day' day day: 'skipDays')
		
		('url' url url: 'image')
		)