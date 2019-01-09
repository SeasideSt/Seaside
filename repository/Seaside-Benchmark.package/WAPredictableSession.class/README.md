A WAPredictableSession has linearly incremented continuation keys. This is unsafe but helpful for testing and benchmarking because it makes recording and replaying session possible because the URLs are always the same.

The benchmarking tool has to support cookies for the sessions. Make sure the benchmarking tool supports redirects, otherwise you'll have to record the action "pages" as well.