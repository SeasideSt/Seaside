instance creation
filepath: filepath mimeType: aMimeType cacheDuration: cacheDuration contents: contents
	^ self new
		filepath: filepath;
		mimeType: aMimeType;
		cacheDuration: cacheDuration;
		contents: contents;
		yourself