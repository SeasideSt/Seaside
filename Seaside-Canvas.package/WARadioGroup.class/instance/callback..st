private
callback: aBlock
	values := Dictionary new.
	key := canvas callbacks store: (WAValuesCallback on: aBlock values: values)