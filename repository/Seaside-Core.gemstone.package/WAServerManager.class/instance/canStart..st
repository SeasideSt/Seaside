private
canStart: aServerAdaptor
	"Because we can't rely on the socket refusing to listen on a port already in use, we simply check here if we know of another adaptor using this adaptor's port"
	^ aServerAdaptor isStopped 
			and: [ self adaptors noneSatisfy: [ :adaptor | 
				(adaptor = aServerAdaptor) not
					and: [ adaptor port = aServerAdaptor port
					and: [ adaptor isStopped not ] ] ] ]