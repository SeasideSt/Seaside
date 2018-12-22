WAUpTimeTracker is used to track the TimeStamp when the image last booted.

Access the TimeStamp when the image booted as follows:

	WAUpTimeTracker imageBootTime.

Access the Duration how long ago the image booted as follows:

	WAUpTimeTracker imageUpTime.

At system startup the imageBootTime is (re)set automatically.

This is a work around for Time millisecondClockValue wrapping around.