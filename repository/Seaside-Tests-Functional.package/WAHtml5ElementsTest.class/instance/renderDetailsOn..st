rendering
renderDetailsOn: html
	html heading level2; with: '<details>'.
	
	html details: [
		html summary: '[Sibley, 2000]'.
		html paragraph: 'Sibley, David Allen, The Sibley Guide to Birds, 
(New York: Chanticleer Press, 2000) p. 247' ]