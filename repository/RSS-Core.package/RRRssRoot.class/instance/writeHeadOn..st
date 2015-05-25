writing
writeHeadOn: aDocument
	self writeStylesOn: aDocument.
	
	aDocument openTag: 'rss' attributes: rssAttributes.
	aDocument openTag: 'channel' attributes: channelAttributes