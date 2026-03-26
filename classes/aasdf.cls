public class aasdf
{
      public String Login_User{get;set;}
      public boolean Show_profile{get;set;}
   	  public profile__c us{get; set;}
      public List<profile__c> users{get; set;}
      public boolean Apex_message{get;set;}
    /*constructor*/
      public  aasdf(){
          
        Login_User=apexpages.currentPage().getParameters().get('attr');
          System.debug('Login_User'+Login_User);
    }
    public void loginapexclass()
    {
        us = new profile__c();
        Apex_message=false;
    }
      /*login*/  
  public PageReference login()
  {
        users = [select MailID__c,Password__c from profile__c where MailID__c=:us.MailID__c];
        for(profile__c user:users)
        {
            System.debug('result'+us.Name);
            if(user.MailID__c==us.MailID__c && user.Password__c==us.Password__c )
            {
                PageReference pageRef = new PageReference('/apex/HomeVF?attr=+us.MailID__c');
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
     /*logout*/  
    Public Pagereference logout(){         
     PageReference newpageclassvff = new PageReference('/apex/loginvf');
        newpageclassvff.setRedirect(true);
        return newpageclassvff;
									}
     /*myprofile*/  
    public void gopage()
{
        Show_profile=true;
        users=[select id, Name, MailID__c from Profile__c where MailID__c=:Login_User];  
        system.debug('rtrtrt'+users);
}
}