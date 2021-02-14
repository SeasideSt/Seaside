"
The <track> tag specifies text tracks for media elements 

This element is used to specify subtitles, caption files or other files containing text, that should be visible when the media is playing.
"
Class {
	#name : #WATrackTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #'attributes-kind' }
WATrackTag >> beCaptions [
	"Transcription or translation of the dialogue, sound effects, relevant musical cues, and other relevant audio information, suitable for when the soundtrack is unavailable or not clearly audible (e.g. because it is muted, drowned-out by ambient noise, or because the user is deaf). Overlaid on the video; labeled as appropriate for the hard-of-hearing."
	self kind: 'captions'
]

{ #category : #'attributes-kind' }
WATrackTag >> beChapters [
	"Chapter titles, intended to be used for navigating the media resource. Displayed as an interactive (potentially nested) list in the user agent's interface."
	self kind: 'chapters'
]

{ #category : #attributes }
WATrackTag >> beDefault [
	self default: true
]

{ #category : #'attributes-kind' }
WATrackTag >> beDescriptions [
	"Textual descriptions of the video component of the media resource, intended for audio synthesis when the visual component is obscured, unavailable, or not usable (e.g. because the user is interacting with the application without a screen while driving, or because the user is blind). Synthesized as audio."
	self kind: 'descriptions'
]

{ #category : #'attributes-kind' }
WATrackTag >> beMetadata [
	"Tracks intended for use from script. Not displayed by the user agent."
	self kind: 'metadata'
]

{ #category : #'attributes-kind' }
WATrackTag >> beSubtitles [
	"Transcription or translation of the dialogue, suitable for when the sound is available but not understood (e.g. because the user does not understand the language of the media resource's soundtrack). Overlaid on the video."
	self kind: 'subtitles'
]

{ #category : #attributes }
WATrackTag >> default: aBoolean [
	"The default attribute, if specified, indicates that the track is to be enabled if the user's preferences do not indicate that another track would be more appropriate. There must not be more than one track element with the same parent node with the default attribute specified."
	self attributeAt: 'default' put: aBoolean
]

{ #category : #'attributes-kind' }
WATrackTag >> kind: aString [
	"The kind attribute is an enumerated attribute."
	self attributeAt: 'kind' put: aString
]

{ #category : #attributes }
WATrackTag >> label: aString [
	"The label attribute gives a user-readable title for the track. This title is used by user agents when listing subtitle, caption, and audio description tracks in their user interface."
	self attributeAt: 'label' put: aString
]

{ #category : #attributes }
WATrackTag >> sourceLanguage: aString [
	"The srclang attribute gives the language of the text track data. The value must be a valid BCP 47 language tag. This attribute must be present if the element's kind attribute is in the subtitles state."
	self attributeAt: 'srclang' put: aString
]

{ #category : #accessing }
WATrackTag >> tag [
	^ 'track'
]

{ #category : #attributes }
WATrackTag >> url: aUrlOrString [
	"The src attribute gives the address of the text track data. The value must be a valid non-empty URL potentially surrounded by spaces. This attribute must be present."
	self attributeAt: 'src' put: aUrlOrString
]
