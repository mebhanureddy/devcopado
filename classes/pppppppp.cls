public class pppppppp {
      public List<Profile__c> profiles{get;set;}
      public List<Profile__c> Login_User{get;set;}
      public String profile_Id{set;get;}
      Public string photo_url {get;set;}
      public boolean Show_profile{get;set;}
   	  public profile__c user_Obj{get; set;}
      public boolean Apex_message{get;set;}
      public integer Photo_Index{get;set;} 
      public List<profile_display> profiledisplayList{get;set;}
      public boolean Logindetails{get;set;}
      public boolean UserDetails{get;set;}
      public boolean Registrationform{get;set;}
      public boolean ProfileDetails{get;set;}  
      public boolean ViewRecords{get;set;}   
      public String ids{get;set;}
 	  public boolean Search_Display{get;set;}     
      public boolean search_Details{get;set;}
      public boolean Profile_Information{get;set;}
      public List<profile_display> SearchList{get;set;}
      public Profile__c Profile_Search{get;set;}
 																/*constructor*/
  public pppppppp()
	{
        Search_Display=True;
        search_Details=True;
    }
																    
    public void Filtered_Search()
    { 	
        search_Details=False;
        Search_Display=true;
    
        system.debug('user_Obj.Religion__c'+user_Obj.Religion__c);
        system.debug('user_Obj.Occupation__c'+user_Obj.Occupation__c);
        system.debug('user_Obj.Location__c'+user_Obj.Location__c);
        system.debug(' profiledisplayList'+ profiledisplayList);
        SearchList=new List<profile_display>(); 
        for(profile_display profile_D:profiledisplayList){
            if(profile_D.Occupation==user_Obj.Occupation__c && profile_D.Religion==user_Obj.Religion__c && profile_D.Location == user_Obj.Location__c )
            {
                system.debug('Welcome to sublist');
                SearchList.add(profile_D);
            }
        }
        system.debug('Welcome to sublist'+SearchList);
       
    } 
    /*View Profile*/ 
     public void View_Profile(){
        Profile_Search=new Profile__c();
        ProfileDetails=False;
        Registrationform=False;
        Logindetails=False;
        UserDetails=False;
        search_Details=False;
        Search_Display=False;
        Profile_Information=True;
        system.debug('View_Profile'+profile_Id);
         for(Profile__c profile_Search_data:profiles ){
             if(profile_Search_data.id==profile_Id){
                 system.debug('profile_Search_data'+profile_Search_data);
                 Profile_Search=profile_Search_data;
             }
         }
         system.debug('profile_Search'+ Profile_Search);
       /* user_Obj=[select id,Name,MailID__c,Password__c,Gender__c,Religion__c,Caste__c,Mother_Tongue__c,Phone__c,Date_of_Bith__c,
             Height__c,Education__c,Occupation__c,Annual_Income__c,Location__c,Assets_Value__c,Eating_habit__c,
             Drinking_Habit__c,Smoking__c,Address__c,Languages_Known__c,Photo__c from Profile__c where id=:profile_Id];*/
        system.debug(profile_Id);
    }

       /*wrapper class*/ 
  public class profile_display{
        Public String Photo{get;set;}
        public String Name{get;set;}
        public String Occupation {get;set;}
        public String Location {get;set;}
        public String Religion {get;set;}
        public String id {get;set;}
    }  
}