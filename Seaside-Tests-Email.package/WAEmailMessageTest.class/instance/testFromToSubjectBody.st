tests
testFromToSubjectBody
	| cr |
	cr := String with: Character cr.
	message := WAEmailMessage
		from: self philippeMarschall
		to: self seasideDev
		subject: 'new email package'.
	message setStringBody: 'Hello' wrap: false.
	"we don't test them here: "
	message headers removeKey: 'Date'.
		
	self assert:
'From: "Philippe Marschall" <philippe.marschall@gmail.com>', cr,
'To: "Seaside Developers Mailinglist" <seaside-dev@lists.squeakfoundation.org>',cr ,
'Subject: new email package', cr, cr,
'Hello' = message plainMessage