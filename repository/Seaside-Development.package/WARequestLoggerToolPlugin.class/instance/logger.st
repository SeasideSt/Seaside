accessing
logger

	^ logger ifNil: [ logger := WARequestObjectLogger new ]