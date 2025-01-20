public class PlatformCacheExample {
    @testvisible static Cache.OrgPartition orgPart;
    @testvisible static public final String CACHENAME = 'AppCache'; 
    @testvisible static public final String PARTITIONNAME = 'Map';
    @testvisible static public Map<String,Map<Id,Account>> acctMap = new Map<String,Map<Id,Account>>();
    
    public static void initCache() {
        // assume no limit/performance issues:
        Map<Id,Account> accountMap = new Map<Id,Account>([SELECT Id,Name FROM Account 
                                                      		WHERE Type LIKE '%PARTNER%']); 
        if (accountMap != null && accountMap.size() > 0) {
            acctMap.put('PARTNER',accountMap);
            orgPart = Cache.Org.getPartition(CACHENAME);
            System.debug(LoggingLevel.DEBUG,'>>>ORGCACHE PARTITION: ' + orgPart);
            if (orgPart.contains(PARTITIONNAME)) {
                System.debug(LoggingLevel.DEBUG,'>>>CACHE EXISTS: ' + orgPart);
            }
            
            orgPart.put(PARTITIONNAME, acctMap); // put Map into Platform Cache
            System.debug(LoggingLevel.DEBUG,'>>>PARTITION CACHE MAP SIZE: ' + acctMap.size());  
        }
    }
    
    public static Map<String,Map<Id,Account>> getCache() {
        Cache.OrgPartition orgPart = Cache.Org.getPartition(CACHENAME);
        System.debug(LoggingLevel.DEBUG,'>>>CACHE ORGPART: ' + orgPart);
        
        if (orgPart != null && orgPart.contains(PARTITIONNAME)) {
            acctMap = (Map<String,Map<Id,Account>>)orgPart.get(PARTITIONNAME);
            if (acctMap != null) {
                System.debug(LoggingLevel.DEBUG,'>>>CACHED: MAP SIZE: ' + acctMap.size());
				return acctMap;                
            }
        }        
        return null;
    }
    
    public static Cache.OrgPartition getCachePartition() {
        orgPart = Cache.Org.getPartition(CACHENAME);
        System.debug(LoggingLevel.DEBUG,'>>>CACHE ORGPART: ' + orgPart);
        
        if (orgPart != null && orgPart.contains(PARTITIONNAME)) {
			return orgPart;
        }        
        return null;
    }    
    
    public static void invalidateCache(Boolean reinit) {
        orgPart.remove(PARTITIONNAME);
        if (reinit) {
        	initCache(); // re-initialize
        }
    }
}
