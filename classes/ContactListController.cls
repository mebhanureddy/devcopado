public class ContactListController{

    public  id tid{get;set;}
    public ContactListController(ApexPages.StandardController controller)
     {
          Profile__c rec= (Profile__c)controller.getRecord();
          if(rec !=null)        
             tid = rec.id;
           System.debug('**************Verify Id is here**************'+tid); 
     }
     
    public List<Profile__c> getMydtpList()
    {
         List<Profile__c> mydtpList =[select Name, Phone__c from Profile__c ];
        return mydtpList ;
        }
}