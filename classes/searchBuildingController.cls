public class searchBuildingController {
    @AuraEnabled
 public static List < Building__c > fetchBuilding (String searchKeyWord) {
  String searchKey = '%'+searchKeyWord+'%';
 
  string lstOfBuilding = '';
          if(searchKeyWord!=null){
            lstOfBuilding = 'select id, Name, Area__c, City__c, Owner_Name__c, Phone__c from Building__c where Name LIKE: searchKey ';
        }else{
            lstOfBuilding = 'select id, Name, Area__c, City__c, Owner_Name__c, Phone__c from Building__c ';
        }                        
             
   list<sobject> sobjectlist = database.query(lstOfBuilding);
        return sobjectlist;
  
 }
    
}