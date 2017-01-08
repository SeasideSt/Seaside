streaming
nextChunkPut: data
	"Write a chunk of data to the external stream. Does NOT write if no data is provided since this would logically end the chunked transfer. To end data transfer use #close instead. Raise an error if the response has been committed and closed."

	self nextChunk: data size put: data