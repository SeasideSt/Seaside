"
WAMediaElementTag is an abstract class for all the media elements providing common media attributes.
See: http://www.w3.org/TR/html5/video.html#media-element
"
Class {
	#name : #WAMediaElementTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WAMediaElementTag >> autoplay: aBoolean [
	"The autoplay attribute is a boolean attribute. When present, the user agent (as described in the algorithm described herein) will automatically begin playback of the media resource as soon as it can do so without stopping."
	self attributeAt: 'autoplay' put: aBoolean
]

{ #category : #attributes }
WAMediaElementTag >> controls: aBoolean [
	"The controls attribute is a boolean attribute. If present, it indicates that the author has not provided a scripted controller and would like the user agent to provide its own set of controls."
	self attributeAt: 'controls' put: aBoolean
]

{ #category : #attributes }
WAMediaElementTag >> loop: aBoolean [
	"The loop attribute is a boolean attribute that, if specified, indicates that the media element is to seek back to the start of the media resource upon reaching the end."
	self attributeAt: 'loop' put: aBoolean
]

{ #category : #'attributes-events' }
WAMediaElementTag >> onCanPlay: anObject [
	"The user agent can resume playback of the media data, but estimates that if playback were to be started now, the media resource could not be rendered at the current playback rate up to its end without having to stop for further buffering of content."

	self document scriptGenerator
		event: 'canplay'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WAMediaElementTag >> onCanPlayThrough: anObject [
	"The user agent estimates that if playback were to be started now, the media resource could be rendered at the current playback rate all the way to its end without having to stop for further buffering."

	self document scriptGenerator
		event: 'canplaythrough'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WAMediaElementTag >> onDurationChange: anObject [
	"The duration attribute has just been updated."

	self document scriptGenerator
		event: 'durationchange'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WAMediaElementTag >> onEmptied: anObject [
	"A media element whose networkState was previously not in the NETWORK_EMPTY state has just switched to that state (either because of a fatal error during load that's about to be reported, or because the load() method was invoked while the resource selection algorithm was already running)."

	self document scriptGenerator
		event: 'emptied'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WAMediaElementTag >> onEnded: anObject [
	"Playback has stopped because the end of the media resource was reached."

	self document scriptGenerator
		event: 'ended'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WAMediaElementTag >> onLoadStart: anObject [
	"The user agent begins looking for media data, as part of the resource selection algorithm."

	self document scriptGenerator
		event: 'loadstart'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WAMediaElementTag >> onLoadedData: anObject [
	"The user agent can render the media data at the current playback position for the first time."

	self document scriptGenerator
		event: 'loadeddata'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WAMediaElementTag >> onLoadedMetadata: anObject [
	"The user agent has just determined the duration and dimensions of the media resource and the text tracks are ready."

	self document scriptGenerator
		event: 'loadedmetadata'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WAMediaElementTag >> onPause: anObject [
	"The element has been paused. Fired after the pause() method has returned."

	self document scriptGenerator
		event: 'pause'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WAMediaElementTag >> onPlay: anObject [
	"The element is no longer paused. Fired after the play() method has returned, or when the autoplay attribute has caused playback to begin."

	self document scriptGenerator
		event: 'play'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WAMediaElementTag >> onPlaying: anObject [
	"Playback is ready to start after having been paused or delayed due to lack of media data."

	self document scriptGenerator
		event: 'playing'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WAMediaElementTag >> onProgress: anObject [
	"The user agent is fetching media data."

	self document scriptGenerator
		event: 'progress'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WAMediaElementTag >> onRateChange: anObject [
	"Either the defaultPlaybackRate or the playbackRate attribute has just been updated."

	self document scriptGenerator
		event: 'ratechange'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WAMediaElementTag >> onSeeked: anObject [
	"The seeking IDL attribute changed to false after the current playback position was changed."

	self document scriptGenerator
		event: 'seeked'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WAMediaElementTag >> onSeeking: anObject [
	"The seeking IDL attribute changed to true, and the user agent has started seeking to a new position."

	self document scriptGenerator
		event: 'seeking'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WAMediaElementTag >> onStalled: anObject [
	"The user agent is trying to fetch media data, but data is unexpectedly not forthcoming."

	self document scriptGenerator
		event: 'stalled'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WAMediaElementTag >> onSuspend: anObject [
	"The user agent is intentionally not currently fetching media data."

	self document scriptGenerator
		event: 'suspend'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WAMediaElementTag >> onTimeUpdate: anObject [
	"The current playback position changed as part of normal playback or in an especially interesting way, for example discontinuously."

	self document scriptGenerator
		event: 'timeupdate'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WAMediaElementTag >> onVolumeChange: anObject [
	"Either the volume attribute or the muted attribute has changed. Fired after the relevant attribute's setter has returned."

	self document scriptGenerator
		event: 'volumechange'
		do: anObject
		on: self
]

{ #category : #'attributes-events' }
WAMediaElementTag >> onWaiting: anObject [
	"Playback has stopped because the next frame is not available, but the user agent expects that frame to become available in due course."

	self document scriptGenerator
		event: 'waiting'
		do: anObject
		on: self
]

{ #category : #attributes }
WAMediaElementTag >> preload: aString [
	"The preload attribute is intended to provide a hint to the user agent about what the author thinks will lead to the best user experience.
	See: http://www.w3.org/TR/html5/video.html#attr-media-preload
	
	The preload attribute can have one of three values: 'none', 'metadata', 'auto'.
	Providing an empty string defaults the value of the attribute to be 'auto'."
	self attributeAt: 'preload' put: aString
]

{ #category : #attributes }
WAMediaElementTag >> url: aString [
	self attributeAt: 'src' put: aString
]
