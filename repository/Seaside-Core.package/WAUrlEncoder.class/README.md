I do percent-encoding of parts (e.g. path segments and arguments) of a URI.

Additionally, a Codec is given the chance to encode the characters into bytes before being percent-encoded (see http://tools.ietf.org/html/rfc3986#section-2.5). This allows extended characters to be represented in URIs in, for example, UTF-8.