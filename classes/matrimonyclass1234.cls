public class matrimonyclass1234 {
      public List<Profile__c> profiles{get;set;}
      Public string photo_url {get;set;}
      public String Login_User{get;set;}
      public boolean Show_profile{get;set;}
     public profile__c ussser{get; set;}
      public List<profile__c> users{get; set;}
      public boolean Apex_message{get;set;}
      public integer Photo_Index{get;set;}
      public List<profile_display> profiledispList{get;set;}
      public string passInput{get;set;}
      Public String ids=Apexpages.currentPage().getParameters().get('id');
     /* public boolean ShowPageBlockFlag{get;set;}
      public Profile__c profilerecords{set;get;} */
   public boolean Logindetails{get;set;}
      public boolean UserDetails{get;set;}
      public boolean Registrationform{get;set;}
      public boolean ProfileDetails{get;set;}  
 /*constructor*/
  public matrimonyclass1234()
{
        profiledispList=new List<profile_display>();  
        Login_User =apexpages.currentPage().getParameters().get('attr');
        ussser = new profile__c();
        Apex_message=True;
        Logindetails=True;
        UserDetails=False;
        Registrationform=False;
        ProfileDetails=False;
}

    /*login*/
   
  public void login()
  {
       Registrationform=False;
        Logindetails=False;
        UserDetails=True;
        users = [select MailID__c,Password__c,Gender__c from profile__c where MailID__c=:ussser.MailID__c];
   
        for(profile__c user:users)
        {
            if(user.MailID__c==ussser.MailID__c && user.Password__c==ussser.Password__c )
            {
            profiles = [select Name, Photo__c, Religion__c, Occupation__c, Location__c,Gender__c from Profile__c where Gender__c!=:user.Gender__c];
           
            system.debug('profiles'+profiles);
              for(Profile__c p:profiles)
    {
         profile_display PD=new profile_display();
        String firstSubString = p.Photo__c.substringBetween('<img', 'img>');
System.debug('First substring: ' + firstSubString);

photo_url=firstSubString.substringBetween('src="', '"');
System.debug('Second substring: ' + photo_url);
         PD.Photo=photo_url;
         PD.Name=p.Name;
         PD.Occupation=p.Occupation__c;
         PD.Location=p.Location__c;            
         profiledispList.add(PD);
           
    }      
               
            }
            else
            {
                System.debug('result'+ussser.MailID__c);
                Apex_message=true;
                apexpages.Message myMsg=new Apexpages.Message(Apexpages.Severity.ERROR,'Invalid Login Credentials');
                apexpages.addMessage(myMsg);
                System.debug('Credentials are incorrect');
            }
           
        }
     
      }  
     /*new user*/
    public void newuser()
    {
        Registrationform=True;
        Logindetails=False;
        UserDetails=False;
       
    }  
     /*save redirect*/
     Public void Register(){
         insert ussser;
     Registrationform=False;
        Logindetails=True;
        UserDetails=False;
}
      /*logout*/
    Public void logout(){
        Registrationform=False;
        Logindetails=True;
        UserDetails=False;
     
}

     /*Back redirect*/
    public void doMappingPage(){
     Registrationform=False;
        Logindetails=True;
        UserDetails=False;
  }
     /*My Profile*/
        public void Myprofile()
    {
        ProfileDetails=true;
        Registrationform=False;
        Logindetails=False;
        UserDetails=False;
        users=[select Name, Phone__c, MailID__c, Religion__c, Occupation__c, Location__c,Gender__c from Profile__c where  MailID__c=:ussser.MailID__c];  
        system.debug('users'+users);
    }
     /*view details*/
   
   
 /*   public  void viewdetails(){
profilerecords = [select Name, Religion__c, Occupation__c, Location__c,Gender__c from Profile__c limit 1];
    ShowPageBlockFlag= False;
    }
        public void ShowBlockMethod(){
            ShowPageBlockFlag = true;
       
    }
    */
   
       /*wrapper class*/
  public class profile_display{
        Public String Photo{get;set;}
        public String Name{get;set;}
        public String Occupation {get;set;}
        public String Location {get;set;}
    }  

 
}