helpers
scrollWindowBy: distancePoint

	driver executeScript: 'window.scrollBy(arguments[0], arguments[1])'
		with: { distancePoint x. distancePoint y }.