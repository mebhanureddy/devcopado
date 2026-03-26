public class datatabledisplay {
    @AuraEnabled
    public static list<sObject> Records (string objects){
        string Query;
        if(objects=='Phone__c'){
        Query='select Id,Name,Owner_Name__c,Phone_No__c,Date_of_Purchase__c,Address__c from '+objects;
        }else{
            Query='select Id,name,Owner_Name__c,Phone_No__c,Date_of_Purchase__c,Address__c,Store__c from '+objects;    
        }
        List<Sobject> sobjectlist= database.query(Query);
        system.debug('sobjectlist'+sobjectlist);
        return sobjectlist;
    }
}