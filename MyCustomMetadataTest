public class MockCustomMetadataTest {

   @testvisible public static List<MyCustomMetadata__mdt> testMDT() {
		List<Approval_Hierarchy__mdt> mocks = ahmdList;

        Map<String, Object> fields = new Map<String, Object>();
        fields.put(MyCustomMetadata__mdt.Label.getDescribe().getName(), 'Operations');
        fields.put(MyCustomMetadata__mdt.DeveloperName.getDescribe().getName(), 'Operations');
        fields.put(MyCustomMetadata__mdt.OtherName__c.getDescribe().getName(), null);
        fields.put(MyCustomMetadata__mdt.ObjectField__c.getDescribe().getName(), 'OwnerId');   
        fields.put(MyCustomMetadata__mdt.Active__c.getDescribe().getName(), true);        
        fields.put(MyCustomMetadata__mdt.Criteria__c.getDescribe().getName(), true); 
        fields.put(MyCustomMetadata__mdt.ObjectName__c.getDescribe().getName(), 'Test__c');
        MyCustomMetadata__mdt mockRule1 = (MyCustomMetadata__mdt) JSON.deserialize(JSON.serialize(fields), MyCustomMetadata__mdt.class);
        mocks.add(mockRule1);

        fields = new Map<String, Object>();
        fields.put(MyCustomMetadata__mdt.Label.getDescribe().getName(), 'Sales');
        fields.put(MyCustomMetadata__mdt.DeveloperName.getDescribe().getName(), 'Sales');
        fields.put(MyCustomMetadata__mdt.OtherName__c.getDescribe().getName(), 'BasicApproval');
        fields.put(MyCustomMetadata__mdt.ObjectField__c.getDescribe().getName(), 'ManagerId');   
        fields.put(MyCustomMetadata__mdt.Active__c.getDescribe().getName(), true);        
        fields.put(MyCustomMetadata__mdt.Criteria__c.getDescribe().getName(), false);  
        fields.put(MyCustomMetadata__mdt.ObjectName__c.getDescribe().getName(), 'Test__c');
        MyCustomMetadata__mdt mockRule2 = (MyCustomMetadata__mdt) JSON.deserialize(JSON.serialize(fields), MyCustomMetadata__mdt.class);
        mocks.add(mockRule2); 
                
        return mocks;
    }      
}
