rendering
renderStartOn: html
	html label
		for: html nextId;
		with: 'start:'.
	html space.
	html numberInput
		value: start;
		callback: [ :value |  [ start := value greaseInteger ] on: Error do: [ :e | "ignore" nil ] ]