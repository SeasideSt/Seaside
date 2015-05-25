processing
process
	[ super process ] on: Error do: [ :err | err defaultAction ]