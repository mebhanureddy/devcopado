public with sharing class Lightning_Accordion 
{
  @auraenabled
    public static list<Account> AccountRelatedContacts(){
        return[select id,name,(select id,LastName from Contacts) from Account LIMIT 15];
    }
    
}