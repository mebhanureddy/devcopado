public with sharing class BoatSearchResults {
    @AuraEnabled
    public static List<BoatType__c> getBoats(String boatTypeId) {
        List<BoatType__c> boattype =[select id, name from BoatType__c];
        return boattype;
    }
}