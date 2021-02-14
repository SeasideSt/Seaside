"
I'm an abstract canvas base class for building canvas for custom XML dialects.
"
Class {
	#name : #WAXmlCanvas,
	#superclass : #WATagCanvas,
	#category : 'Seaside-Canvas-Canvas'
}

{ #category : #'instance creation' }
WAXmlCanvas class >> builder [
	^ super builder
		documentClass: WAXmlDocument;
		rootClass: WAXmlRoot;
		yourself
]

{ #category : #private }
WAXmlCanvas >> break [
	^ String with: Character cr with: Character lf
]

{ #category : #convenience }
WAXmlCanvas >> cdata: aString [
	"aString must not include ']]>'
	
	Google says if there is an error in the feed, there is a 0.02% chance
	that this is the cause, combined with the fact that about 7% of all feeds
	have errors there is a (2 / 10000) * (7 / 100) chance this goes wrong.
	Do you deal in chance?
	
	http://googlereader.blogspot.com/2005/12/xml-errors-in-feeds.html"
	self flush.
	self document nextPutAll: '<![CDATA['.
	self document nextPutAll: aString.
	self document nextPutAll: ']]>'
]

{ #category : #private }
WAXmlCanvas >> spaceEntity [
	^ '&#160;'
]
