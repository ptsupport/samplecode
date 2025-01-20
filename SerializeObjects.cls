public class SerializeObjects {
    public static String serializeRecord(sObject so, Boolean doInsert) {
        String recName = so.getsObjectType() + '-' + so.Id; 
        Utility__c ut = new Utility__c(Name=recName);
        ut.Record_Data__c = JSON.serialize(so); // pseudo-clone
        if (doInsert) {
        	insert ut;
        }
        return ut.Record_Data__c;
    }
}
