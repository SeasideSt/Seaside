I can be used to serve files directly from disk rather than having to load them into methods using a WAFileLibrary. 

It has two options: 
- list file directories or not (defaults to false).
- the directory to serve (defaults to the image directory).

Usage:
|app|
app := WAAdmin register: WAExternalFileLibrary at: 'myfilesondisk'.
app 
	preferenceAt: #listing put: true;
	preferenceAt: #directory put: '/'