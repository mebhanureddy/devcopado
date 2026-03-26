public with sharing class CreateStaffRecord {
    
    @AuraEnabled
    public static void updateRecord(Staff__c staff){
        try{
            update staff;
        }catch(DMLException e){
            throw new AuraHandledException(e.getDMLMessage(0)); 
        }catch(Exception e){
            throw new AuraHandledException(e.getMessage()); 
        }       
    }  
    
    @AuraEnabled
    public static Staff__c deleteRecord(Staff__c staff){
        try{
            if(staff != null){
                delete staff;
            }
        }catch(DMLException e){
            throw new AuraHandledException(e.getDMLMessage(0)); 
        }catch(Exception e){
            throw new AuraHandledException(e.getMessage()); 
        }  
        return staff;
    }
}