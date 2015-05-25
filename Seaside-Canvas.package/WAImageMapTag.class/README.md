A WAImageMapTag is supposed to be used like this:

	html map
		callback: [ :point | self click: point ];
		with: [ html image url: 'foo.gif' ]
			
An example can be found in WAScreenshot.

Technical:
http://www.w3.org/TR/html4/struct/objects.html#include-maps

The location clicked is passed to the server as follows. The user agent derives a new URI from the URI specified by the href attribute of the A element, by appending `?' followed by the x and y coordinates, separated by a comma. The link is then followed using the new URI. For instance, in the given example, if the user clicks at the location x=10, y=27 then the derived URI is "http://www.acme.com/cgi-bin/competition?10,27".
