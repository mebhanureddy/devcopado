public class Matrimony {
    public List<Profile__c> profiles{get;set;}
    public List<Profile__c> Login_User{get;set;}
    public String profile_Id{set;get;}
    Public string photo_url {get;set;}
    public boolean Show_profile{get;set;}
    public Profile__c user_Obj{get; set;}
    public boolean Apex_message{get;set;}
    public integer Photo_Index{get;set;} 
    public List<profile_display> profiledisplayList{get;set;}
    public boolean Logindetails{get;set;}
    public boolean UserDetails{get;set;}
    public boolean UserDetailsaftersearch{get;set;}
    public boolean Registrationform{get;set;}
    public boolean ProfileDetails{get;set;}  
    public boolean ViewRecords{get;set;}   
    public String ids{get;set;}
    public boolean Search_Display{get;set;}     
    public boolean search_Details{get;set;}
    public boolean Profile_Information{get;set;}
    public boolean Payment_Display{get;set;}
    public List<profile_display> SearchList{get;set;}
    public Profile__c Profile_Search{get;set;}
    public List<SelectOption> options{get;set;}
    public List<SelectOption> options1{get;set;}
    public List<SelectOption> options3{get;set;}
    public List<SelectOption> options4{get;set;}
    public List <String> Occupation_Inputs {get;set;}
    public List <String> Religion_Inputs {get;set;}
    public List <String> Caste_Inputs {get;set;}
    public List <String> location_Inputs {get;set;}
    public subscription__c sub_Obj {get; set;}
    public String user_Id{set;get;}
    public String user_Mailid{set;get;}
    public List<subscription__c> Sub_User{get;set;}
    public string SelectedList{set;get;}
    public boolean Show_images {get;set;}
    public boolean istest {get;set;}
    /*constructor*/
    public Matrimony()
    {
        profiledisplayList=new List<profile_display>(); 
        Religion_Inputs= new String[]{};
            Occupation_Inputs= new String[]{};
                Caste_Inputs= new String[]{};
                    location_Inputs= new String[]{};
                        ids=Apexpages.currentPage().getParameters().get('id');
        user_Obj = new profile__c();
        sub_Obj=new subscription__c();
        Apex_message=True;
        Logindetails=True;
        UserDetails=False;
        UserDetailsaftersearch=False;
        Registrationform=False;
        ProfileDetails=False;
        ViewRecords=False;
        Search_Display=False;
        search_Details=False;
        Profile_Information=False;
        Payment_Display=False;
        Show_images=True;
    }
    /*login*/ 
    public void login()
    {
        if(istest==true){
            user_Obj.MailID__c=ApexPages.currentPage().getParameters().get('mailid');
            user_Obj.Password__c=ApexPages.currentPage().getParameters().get('Password');
            // system.debug('user.name'+user.name);
            //system.debug('user.Password__c'+user.Password__c);
        }if(istest==false){
            user_Obj.MailID__c=ApexPages.currentPage().getParameters().get('mailid');
            user_Obj.Password__c=ApexPages.currentPage().getParameters().get('Password');
            profiledisplayList=new List<profile_display>(); 
        }
        Login_User = [select id,Name, MailID__c,Password__c, Gender__c,Photo__C,  Phone__C, Occupation__c, Location__c,Religion__c from Profile__c where MailID__c=:user_Obj.MailID__c];
        for(profile__c user:Login_User)
        {
            if(user.MailID__c==user_Obj.MailID__c && user.Password__c==user_Obj.Password__c )
            {
                user_Id=user.Id;
                user_Mailid=user.MailID__c;
                sub_Obj.Name=user.Name;
                sub_Obj.Mail_id__c=user.MailID__c;
                profiles = [select id,Name,MailID__c,Password__c,Gender__c,Religion__c,Caste__c,Mother_Tongue__c,Phone__c,Date_of_Bith__c,Height__c,Education__c,Occupation__c,Annual_Income__c,Location__c,Assets_Value__c,Eating_habit__c,
                            Drinking_Habit__c,Smoking__c,Address__c,Languages_Known__c,Photo__c from Profile__c where Gender__c!=:user.Gender__c];
                Registrationform=False;
                Logindetails=False;
                UserDetails=True;
                Show_images=False;
                UserDetailsaftersearch=False;
                ViewRecords=False;
                ProfileDetails=False;
                search_Details=False;
                Search_Display=False;
                Payment_Display=False;
                Profile_Information=False;
                system.debug('profiles'+profiles);
            }
            else
            { 
                /*  System.debug('result'+user_Obj.MailID__c);
Apex_message=true;
apexpages.Message myMsg=new Apexpages.Message(Apexpages.Severity.ERROR,'Invalid Login Credentials');
apexpages.addMessage(myMsg);
System.debug('Credentials are incorrect');*/
            }
        }
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
            PD.Religion=P.Religion__c;  
            PD.Caste=P.Caste__c;
            PD.id=p.Id;
            PD.Caste=p.Caste__c;
            profiledisplayList.add(PD);
        }     
    }
    /*new user*/
    public void newuser()
    {
        {
            Registrationform=True;
            Logindetails=False;
            UserDetails=False;
            UserDetailsaftersearch=False;
            ViewRecords=False;
            ProfileDetails=False;
            search_Details=False;
            Search_Display=False;
            Profile_Information=False;
            Payment_Display=False;
            Show_images=False;
        }  user_Obj.clear(); 
    }
    /*save redirect*/ 
    Public void Register(){ 
        Registrationform=False;
        Logindetails=True;
        UserDetails=False;
        UserDetailsaftersearch=False;
        ProfileDetails=False;
        search_Details=False;
        Search_Display=False;
        Profile_Information=False;
        Payment_Display=False;
        Show_images=False;
        insert user_Obj;
    }
    /*logout*/ 
    Public void logout(){
        Registrationform=False;
        Logindetails=True;
        UserDetails=False;
        UserDetailsaftersearch=False;
        ViewRecords=False;
        ProfileDetails=False;
        search_Details=False;
        Search_Display=False;
        Profile_Information=False;
        Payment_Display=False;
        Show_images=True;
    }
    /*Back home redirect*/ 
    public void backhomePage(){
        Registrationform=False;
        Logindetails=False;
        UserDetails=True;
        UserDetailsaftersearch=False;
        ViewRecords=False;
        ProfileDetails=False;
        search_Details=False;
        Search_Display=False;
        Payment_Display=False;
        Profile_Information=False;
        Show_images=False;
        // user_Obj.Occupation__c=null; user_Obj.Location__c=null;user_Obj.Religion__c=null;
    }
    /*Back login redirect*/ 
    public void backloginPage(){
        Registrationform=False;
        Logindetails=True; 
        UserDetails=False;
        UserDetailsaftersearch=False;
        ViewRecords=False;
        ProfileDetails=False;
        search_Details=False;
        Search_Display=False;
        Profile_Information=False;
        Payment_Display=False;
        Show_images=True;
    }
    /*Back Search redirect*/ 
    public void backsearchPage(){
        Registrationform=False;
        Logindetails=False; 
        UserDetails=False;
        ViewRecords=False;
        ProfileDetails=False;
        search_Details=True;
        Search_Display=False;
        Profile_Information=False;
        Payment_Display=False;
        Show_images=False;
    }
    /*My Profile*/
    public void Myprofile()
    {
        ProfileDetails=true;
        Registrationform=False;
        Logindetails=False;
        UserDetails=False;
        UserDetailsaftersearch=False;
        ViewRecords=False;
        search_Details=False;
        Search_Display=False;
        Payment_Display=False;
        Profile_Information=False;
        Show_images=False;
        //Login_User=[select Name, Phone__c, MailID__c, Religion__c, Occupation__c, Location__c from Profile__c where  MailID__c=:user_Obj.MailID__c];  
        system.debug('Login_User'+Login_User);
    }
    /*Update Details*/ 
    public void SaveDetails()
    {
        ProfileDetails=True;
        Registrationform=False;
        Logindetails=False;
        UserDetails=False;
        UserDetailsaftersearch=False;
        ViewRecords=False;
        search_Details=False;
        Search_Display=False;
        Profile_Information=False;
        Payment_Display=False;
        Show_images=False;        
        update Login_User;
    }
    /*view details*/ 
    public  void ViewRecords(){
        ProfileDetails=False;
        Registrationform=False;
        Logindetails=False;
        UserDetails=False;
        UserDetailsaftersearch=False;
        ViewRecords=True;
        search_Details=False;
        Search_Display=False;
        Profile_Information=False;
        Payment_Display=False;
        Show_images=False;
    }  
    /*Search Button*/ 
    public void Search_Button()
    {
        ProfileDetails=False;
        Registrationform=False;
        Logindetails=False;
        UserDetails=False;
        UserDetailsaftersearch=False;
        search_Details=true;
        Search_Display=False;
        Profile_Information=False;
        Payment_Display=False;
        Show_images=False;
    }
    /*Filter Search*/ 
    /* public void Filtered_Search()
{
profiledisplayList=new List<profile_display>();
list<Profile__c> ppp=[select Name,Photo__c, Religion__c, Occupation__c, Location__c from Profile__c where  Occupation__c=:user_Obj.Occupation__c AND Location__c=:user_Obj.Location__c AND Religion__c=:user_Obj.Religion__c];
system.debug(ppp);
for(Profile__c p:ppp)
{
profile_display PD1=new profile_display();
String firstSubString = p.Photo__c.substringBetween('<img', 'img>');
System.debug('First substring: ' + firstSubString);
photo_url=firstSubString.substringBetween('src="', '"');
System.debug('Second substring: ' + photo_url);
PD1.Photo=photo_url;
PD1.Name=p.Name;
PD1.Occupation=p.Occupation__c;
PD1.Location=p.Location__c; 
PD1.id=p.Id;
profiledisplayList.add(PD1);
system.debug(profiledisplayList);
}     
system.debug('profiles'+profiles);
ProfileDetails=False;
Registrationform=False;
Logindetails=False;
UserDetails=False;
search_Details=False;
Search_Display=true;
Profile_Information=False;
} */
    /* public void Filtered_Search()
{ 	
system.debug('**************************************************selectedOccupation'+Occupation_Inputs);
ProfileDetails=False;
Registrationform=False;
Logindetails=False;
UserDetails=False;
search_Details=False;
Search_Display=true;
Profile_Information=False;
system.debug('**************************************************selectedOccupation'+caste_Inputs);
system.debug('**************************************************selectedOccupation'+religion_Inputs);
system.debug('**************************************************selectedOccupation'+location_Inputs);
system.debug('user_Obj.Religion__c'+user_Obj.Religion__c);
system.debug('user_Obj.Occupation__c'+user_Obj.Occupation__c);
system.debug('user_Obj.Location__c'+user_Obj.Location__c);
system.debug(' profiledisplayList'+ profiledisplayList);
SearchList=new List<profile_display>(); 
for(profile_display profile_D:profiledisplayList){
if(profile_D.Occupation==user_Obj.Occupation__c && profile_D.Religion==user_Obj.Religion__c && profile_D.Location == user_Obj.Location__c && profile_D.Caste == user_Obj.Caste__c)
{
system.debug('Welcome to sublist');
SearchList.add(profile_D);
}
}
system.debug('Welcome to sublist'+SearchList);

} */
    public void Filtered_Search()
    { 	ProfileDetails=False;
     Registrationform=False;
     Logindetails=False;
     UserDetailsaftersearch=True;
     UserDetails=False;
     search_Details=False;
     Search_Display=False;
     Profile_Information=False;
     Payment_Display=False;
     Show_images=False;
     SearchList=new List<profile_display>();
     for(profile_display prodis:profiledisplayList){
         //system.debug('profiledisplayList'+prodis);
         if(Occupation_Inputs.contains(prodis.Occupation)&& (Religion_Inputs.contains(prodis.Religion)) && (Caste_Inputs.contains(prodis.Caste)) && (Location_Inputs.contains(prodis.Location)) ) {
             SearchList.add(prodis);
         }
     }
    }
    /*View Profile*/ 
    public void View_Profile(){
        if(istest==true){
            user_Mailid=ApexPages.currentPage().getParameters().get('mailid');
        }
        Sub_User=[select id,Name,Mail_id__c,Status__c from subscription__c];
        for(subscription__c SU : Sub_User)
        {
            if(SU.Mail_id__c==user_Mailid && SU.Status__c=='Active')
            {
                Profile_Search=new Profile__c(); 
                ProfileDetails=False;
                Registrationform=False;
                Logindetails=False;
                UserDetails=False;
                UserDetailsaftersearch=False;
                search_Details=False;
                Search_Display=False;
                Profile_Information=True;
                Payment_Display=False;
                Show_images=False;
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
        }
    }
    /*Picklist as checkbox*/ 
    public List<selectOption> getoccupation()
    {
        options = new List<SelectOption>();
        Schema.DescribeFieldResult fieldresult=Schema.Profile__c.Occupation__c.getDescribe();
        List<Schema.PicklistEntry> ple=fieldResult.getPicklistValues();
        for(Schema.PicklistEntry f : ple)
        {
            options.add(new SelectOption(f.getLabel(), f.getValue()));
        } 
        return options;      
    }
    public List<selectOption> getreligion()
    {
        options1 = new List<SelectOption>();
        Schema.DescribeFieldResult fieldresult=Schema.Profile__c.Religion__c.getDescribe();
        List<Schema.PicklistEntry> ple=fieldResult.getPicklistValues();
        for(Schema.PicklistEntry f : ple)
        {
            options1.add(new SelectOption(f.getLabel(), f.getValue()));
        } 
        return options1;      
    }
    public List<selectOption> getcaste()
    {
        options3 = new List<SelectOption>();
        Schema.DescribeFieldResult fieldresult=Schema.Profile__c.Caste__c.getDescribe();
        List<Schema.PicklistEntry> ple=fieldResult.getPicklistValues();
        for(Schema.PicklistEntry f : ple)
        {
            options3.add(new SelectOption(f.getLabel(), f.getValue()));
        } 
        return options3;      
    }
    public List<selectOption> getlocation()
    {
        options4= new List<SelectOption>();
        Schema.DescribeFieldResult fieldresult=Schema.Profile__c.Location__c.getDescribe();
        List<Schema.PicklistEntry> ple=fieldResult.getPicklistValues();
        for(Schema.PicklistEntry f : ple)
        {
            options4.add(new SelectOption(f.getLabel(), f.getValue()));
        } 
        return options4;      
    }
    
    public void subbutton()
    {
        ProfileDetails=False;
        Registrationform=False;
        Logindetails=False;
        UserDetails=False;
        UserDetailsaftersearch=False;
        search_Details=False;
        Search_Display=False;
        Profile_Information=False;
        Payment_Display=True;
        Show_images=False;
    }
    public void payment()
    {
        if(istest==true)
        {
            sub_Obj.Name = ApexPages.currentPage().getParameters().get('Name');
            sub_Obj.Card_Number__c = 852296345;
            sub_Obj.CVV__c =258;
            sub_Obj.Expiry_Date__c = Date.today();
            sub_Obj.Username__c = ApexPages.currentPage().getParameters().get('username');
            sub_Obj.Mail_id__c = ApexPages.currentPage().getParameters().get('Mail');
            sub_Obj.Password__c = ApexPages.currentPage().getParameters().get('password');
        }
        if((sub_Obj.Mail_id__c==null || sub_Obj.CVV__c==null|| sub_Obj.Expiry_Date__c==null) && (sub_Obj.Username__c==null || sub_Obj.Password__c==null))
        {
            system.debug('sub');
            Apex_message=true;
            apexpages.Message myMsg=new Apexpages.Message(Apexpages.Severity.ERROR,'Invalid Login Credentials');
            apexpages.addMessage(myMsg);
        }
        else
        {
            sub_Obj.Name__c=user_Id;
            insert sub_Obj;
            Apex_message=true;
            apexpages.Message myMsg=new Apexpages.Message(Apexpages.Severity.CONFIRM,'Payment Completed Successfully');
            apexpages.addMessage(myMsg);
        }
        sub_Obj.clear();
    }
    /*wrapper class*/ 
    public class profile_display{
        Public String Photo{get;set;}
        public String Name{get;set;}
        public String Occupation {get;set;}
        public String Location {get;set;}
        public String Religion {get;set;}
        public String id {get;set;}
        public String Caste {get;set;}
    }  
}