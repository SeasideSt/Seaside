*seaside-pharo-core
initializeMemorySettingsProfileSeaside
        "Initialize the memory and GC settings to be more in line with Seaside requirements"
        
        "The following settings affect the rate incremental GCs and tenuring"
        
        "Limit incremental GC activity to run every 40k allocations"
        self vmParameterAt: 5 put: 100000. "allocations between GCs (default: 4000)"
        "Limit tenuring threshold to only tenure w/ > 35k survivors"
        self vmParameterAt: 6 put: 35000. "tenuring threshold (default: 2000)"
        
        "These settings affect overall memory usage"
        
        "Only give memory back to the OS when we have more than 16MB free"
        self vmParameterAt: 24 put: 16*1024*1024. "default 8MB"
        "Try to keep 8MB headroom at all times"
        self vmParameterAt: 25 put: 8*1024*1024. "default 4MB"
        
        "These settings describe what to do when we're close to running out of free space"
        
        "Tell the VM that we'd rather grow than spinning in tight GC loops"
        self setGCBiasToGrow: 1. "default: false"
        "Tell the VM to do a fullGC for good measure if the above growth exceeded 16MB"
        self setGCBiasToGrowGCLimit: 16*1024*1024. "default: 0"