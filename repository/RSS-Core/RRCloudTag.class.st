"
<cloud> is an optional sub-element of <channel>.

It specifies a web service that supports the rssCloud interface which can be implemented in HTTP-POST, XML-RPC or SOAP 1.1.

Its purpose is to allow processes to register with a cloud to be notified of updates to the channel, implementing a lightweight publish-subscribe protocol for RSS feeds. 

A full explanation of this element and the rssCloud interface is here:
http://www.rssboard.org/rsscloud-interface
"
Class {
	#name : #RRCloudTag,
	#superclass : #WATagBrush,
	#category : 'RSS-Core-Tags'
}

{ #category : #'accessing-tags' }
RRCloudTag class >> tags [
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
		
		('comments' comments comments: 'item-optional')
		('enclosure' enclosure enclosure: 'item-optional')
		('guid' guid guid: 'item-optional')
		
		('name' name name: 'image-required')
		
		)
]

{ #category : #protocols }
RRCloudTag >> beSoap [
	self protocol: 'soap'
]

{ #category : #protocols }
RRCloudTag >> beXmlRpc [
	self protocol: 'xml-rpc'
]

{ #category : #attributes }
RRCloudTag >> domain: aString [
	^ self attributeAt: 'domain' put: aString
]

{ #category : #attributes }
RRCloudTag >> path: aString [
	^ self attributeAt: 'path' put: aString
]

{ #category : #attributes }
RRCloudTag >> port: anInteger [
	^ self attributeAt: 'port' put: anInteger
]

{ #category : #attributes }
RRCloudTag >> protocol: aString [
	^ self attributeAt: 'protocol' put: aString
]

{ #category : #attributes }
RRCloudTag >> registerProcedure: aString [
	^ self attributeAt: 'registerProcedure' put: aString
]

{ #category : #accessing }
RRCloudTag >> tag [
	^ 'cloud'
]
