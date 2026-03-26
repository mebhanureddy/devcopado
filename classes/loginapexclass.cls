public class loginapexclass {
    public profile__c us{get; set;}
    public List<profile__c> users{get; set;}
    public boolean Apex_message{get;set;}
    public loginapexclass()
    {
        us = new profile__c();
        Apex_message=false;
    }
  public PageReference login()
  {
        users = [select MailID__c,Password__c from profile__c where MailID__c=:us.MailID__c];
        for(profile__c user:users)
        {
            System.debug('result'+us.Name);
            if(user.MailID__c==us.MailID__c && user.Password__c==us.Password__c )
            {
                PageReference pageRef = new PageReference('/apex/HomepageVF');
                return pageRef;
            }
            else
            {
                System.debug('result'+us.MailID__c);
                Apex_message=true;
                apexpages.Message myMsg=new Apexpages.Message(Apexpages.Severity.ERROR,'Invalid Login Credentials');
                apexpages.addMessage(myMsg);
                System.debug('Credentials are incorrect');
            }
        }
       return null;
  }    
 public pageReference newuser()
    {
        PageReference pageRef = new PageReference('/apex/RegistrationVF');
        pageRef.setRedirect(true);
        return pageRef;
    }    
}