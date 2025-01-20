public class MockCustomMetadata {
    public static void initialize(Map<Id,String> appIdMap) {
        List<MyCustomMetadata__mdt> metaList;
        Set<String> metaSet = new Set<String>(appIdMap.values());  
        
        if (Test.isRunningTest()) {
            metaList = MockCustomMetadataTest.testMDT();
        }
        else {
            metaList = new List<MyCustomMetadata__mdt>([SELECT Id,Active__c,DeveloperName,
                                                               OtherName__c,Criteria__c,ObjectField__c   
                                                          FROM MyCustomMetadata__mdt 
                                                          WHERE DeveloperName IN: metaSet WITH USER_MODE]);
        }        
    }
}
