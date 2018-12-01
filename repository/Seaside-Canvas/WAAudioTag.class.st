"
no known browser support, might require an open codec like Ogg Vorbis, might first appear in Opera and Mozilla

An audio element represents a sound or audio stream.

Content may be provided inside the audio element so that older Web browsers, which do not support audio, can display text to the user informing them of how to access the audio contents. User agents should not show this fallback content to the user. 
"
Class {
	#name : #WAAudioTag,
	#superclass : #WAMediaElementTag,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #accessing }
WAAudioTag >> tag [
	^ 'audio'
]
