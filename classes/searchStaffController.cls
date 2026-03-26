public class searchStaffController {
    @AuraEnabled
    public static List<Staff__c> fetchStaff (String searchKeyWord) {
        String searchKey = '%'+searchKeyWord+'%';
        List<Staff__c> returnList = new List<Staff__c>();
        List<Staff__c> lstOfStaff = [select Id, Name,First_Name__c, Middle_Name__c, Last_Name__c,Phone__c,Email__c,Status__c from Staff__c where First_Name__c LIKE: searchKey OR Last_Name__c LIKE: searchKey];
        
        System.debug('Staff **** ' + lstOfStaff);
        
        
        for (Staff__c staff: lstOfStaff) {
            returnList.add(staff);
        }
        return returnList;
    }
}