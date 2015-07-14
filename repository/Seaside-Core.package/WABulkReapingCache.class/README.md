I am a cache that reaps all elements at once instead of incrementally.

I am intended to be used in GemStone/S instead of WAHashCache. A background process should send #reap to me.

    Instance Variables
	dictionary:		<Dictionary>