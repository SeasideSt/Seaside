I match only on an exact number of path elements regardless of the query fields in the url.

I allow the creation of routes where the query fields are unknown beforehand, like when doing filtering, partial reads, etc.

You can access the query fields sending #queryFields to the aWARequest