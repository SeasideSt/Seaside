rendering
renderAudioOn: html
	html heading level2; with: '<audio>'.
	html audio
		url: 'http://upload.wikimedia.org/wikipedia/commons/9/94/Mix.ogg';
		autoplay: true;
		controls: true;
		loop: true;
		preload: true