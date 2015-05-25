I encode everything that is written to myself using #nextPut: and #nextPutAll: onto the wrapped stream. The specific encoding that is done is determined by my subclasses (the conversion of a single character is defined in the class-side method #encode:on:).

To be efficient, each subclass uses a cached encoding table to transform the most used characters from the UTF Basic Multilingual Plane.