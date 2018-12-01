Class {
	#name : #RRTestComponent,
	#superclass : #RRComponent,
	#category : 'RSS-Tests-Core'
}

{ #category : #rendering }
RRTestComponent >> renderContentOn: rss [
	"do nothing"
]

{ #category : #updating }
RRTestComponent >> updateRoot: anRssRoot [
	super updateRoot: anRssRoot.
	anRssRoot stylesheet beXsl
		url: 'http://www.seaside.st/feed.xsl'
]
