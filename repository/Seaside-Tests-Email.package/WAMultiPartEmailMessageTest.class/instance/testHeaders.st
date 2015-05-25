testing
testHeaders
	| now |
	now := GRPrinter rfc822 print: DateAndTime now.
	message replyTo: self philippeMarschall.
	message headerAt: 'Date' put: now.	" We have to take into account, that the header order is not implied."
	self
		assert:
			((self convertLineEndingsToCr: ('From: "Philippe Marschall" <philippe.marschall@gmail.com>
To: "Seaside Developers Mailinglist" <seaside-dev@lists.squeakfoundation.org>
Subject: new email package
Reply-To: "Philippe Marschall" <philippe.marschall@gmail.com>
Date: ' , now
				,
					'
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
')) = (self convertLineEndingsToCr: message plainMessage)
				or: [ 
					(self convertLineEndingsToCr: ('From: "Philippe Marschall" <philippe.marschall@gmail.com>
To: "Seaside Developers Mailinglist" <seaside-dev@lists.squeakfoundation.org>
Subject: new email package
Reply-To: "Philippe Marschall" <philippe.marschall@gmail.com>
Content-Type: multipart/alternative;boundary=' , message boundary
						,
							'
Date: ' , now
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
')) = (self convertLineEndingsToCr: message plainMessage) ])