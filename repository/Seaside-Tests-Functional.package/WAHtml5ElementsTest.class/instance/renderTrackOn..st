rendering
renderTrackOn: html
	html heading level2; with: '<track>'.
	
	html video
		url: 'brave.webm';
		with: [
			html track
				beSubtitles;
				url: 'brave.en.vtt';
				sourceLanguage: 'en';
				label: 'English'.
			html track
				beCaptions;
				url: 'brave.en.vtt';
				sourceLanguage: 'en';
				label: 'English for the Hard of Hearing'.
			html track
				beSubtitles;
				url: 'brave.fr.vtt';
				sourceLanguage: 'fr';
				language: 'fr';
				label: 'Francais'.
			html track
				beSubtitles;
				url: 'brave.de.vtt';
				sourceLanguage: 'de';
				language: 'de';
				label: 'Deutsch' ]