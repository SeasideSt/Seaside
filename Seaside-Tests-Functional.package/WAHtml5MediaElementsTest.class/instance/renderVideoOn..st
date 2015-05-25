rendering
renderVideoOn: html
	html heading level2; with: '<video>'.
	html video 
		url: 'http://people.opera.com/howcome/2007/video/A_New_Computer--small.ogg';
		autoplay: true;
		controls: true;
		loop: true;
		preload: true;
		poster: 'http://seaside.st/styles/logo-plain.png';
		width: 360; height: 240;
		with: 'Theora decoder not found'