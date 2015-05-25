accessing
items: aCollection
	batcher := WABatchedList new
		items: aCollection;
		batchSize: 8;
		yourself