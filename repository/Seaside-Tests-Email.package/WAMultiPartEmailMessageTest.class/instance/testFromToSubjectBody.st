testing
testFromToSubjectBody
	message headers removeKey: 'Date'.
	self
		assert:
			(self convertLineEndingsToCr: ('From: "Philippe Marschall" <philippe.marschall@gmail.com>
To: "Seaside Developers Mailinglist" <seaside-dev@lists.squeakfoundation.org>
Subject: new email package
Content-Type: multipart/alternative;boundary=' , message boundary
				,
					'


--' , message boundary
				,
					'
Content-Type: text/plain

Hello

--' , message boundary
				,
					'--
'))
		equals: (self convertLineEndingsToCr: message plainMessage)