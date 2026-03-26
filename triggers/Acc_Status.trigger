trigger Acc_Status on Account (before update) 
{
   List<account> accountslist = [SELECT Id, Status__c from Account where id=:trigger.old];
   integer count = [select COUNT() from contact where accountid=:accountslist AND Status__c='Complete'];
   for (account a :Trigger.new){
   if(count>0)
   {
        System.debug('Count' +count);
           a.Status__c='Complete';
   }
       else{
           a.addError('CONTACT STATUS IS INCOMPLETE');
       }
   }
}