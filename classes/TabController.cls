public class TabController {
    @AuraEnabled
    public static List<Account> getAccounts(){
        return [Select Id ,Name from Account Limit 10] ;  
    }
    @AuraEnabled
    public static List<Contact> getContacts(){
        return [Select Id ,Name from Contact Limit 10] ;    
    }
    @AuraEnabled
    public static List<Campaign> getCam(){
        return [Select Id ,Name from Campaign Limit 10] ; 
    }
    @AuraEnabled
    public static List<Case> getCases(){
        return [Select Id ,casenumber from Case Limit 10] ; 
    }
    
}