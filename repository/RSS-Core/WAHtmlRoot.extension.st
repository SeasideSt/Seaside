Extension { #name : #WAHtmlRoot }

{ #category : #'*rss-core' }
WAHtmlRoot >> rss [
	^ self link
		beAlternate;
		beRss;
		yourself
]
