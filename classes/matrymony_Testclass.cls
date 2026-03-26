@isTest
public class matrymony_Testclass {
    @testsetup
    public static void setup()
    {
        Profile__c pro =new Profile__c(Name='Saiteja',MailID__c='saiteja@gmail.com',Password__c='saiteja1',Gender__c='Female',Photo__c='<img alt="User-added image" src="https://mebhanureddy-dev-ed--c.ap15.content.force.com/servlet/rtaImage?eid=a082v00002ptYCk&amp;feoid=00N2v00000SQZoS&amp;refid=0EM2v000002Hh3E"></img>');
        insert pro;
        Profile__c pro1 =new Profile__c(Name='Saiteja1',MailID__c='saiteja2@gmail.com',Password__c='saiteja2',Gender__c='Male',Photo__c='<img alt="User-added image" src="https://mebhanureddy-dev-ed--c.ap15.content.force.com/servlet/rtaImage?eid=a082v00002ptYCk&amp;feoid=00N2v00000SQZoS&amp;refid=0EM2v000002Hh3E"></img>');
        insert pro1;
        Profile__c pro2 =new Profile__c(Name='Saiteja2',MailID__c='saiteja3@gmail.com',Password__c='saiteja3',Gender__c='Female',Photo__c='<img alt="User-added image" src="https://mebhanureddy-dev-ed--c.ap15.content.force.com/servlet/rtaImage?eid=a082v00002ptYCk&amp;feoid=00N2v00000SQZoS&amp;refid=0EM2v000002Hh3E"></img>');
        insert pro2;
        Profile__c pro3 =new Profile__c(Name='Saiteja3',MailID__c='saiteja4@gmail.com',Password__c='saiteja4',Gender__c='Male',Photo__c='<img alt="User-added image" src="https://mebhanureddy-dev-ed--c.ap15.content.force.com/servlet/rtaImage?eid=a082v00002ptYCk&amp;feoid=00N2v00000SQZoS&amp;refid=0EM2v000002Hh3E"></img>');
        insert pro3;
        Profile__c pro4 =new Profile__c(Name='Saiteja4',MailID__c='saiteja5@gmail.com',Password__c='saiteja5',Gender__c='Female',Photo__c='<img alt="User-added image" src="https://mebhanureddy-dev-ed--c.ap15.content.force.com/servlet/rtaImage?eid=a082v00002ptYCk&amp;feoid=00N2v00000SQZoS&amp;refid=0EM2v000002Hh3E"></img>');
        insert pro4;
        subscription__c sub=new subscription__c(Name='saiteja',Mail_id__c='saiteja@gmail.com',Card_Number__c = 852296345,Expiry_Date__c=Date.today(),CVV__c=258,Password__c='saiteja',username__c='saiteja');
        insert sub;       
    }
    static testMethod void newuser()
    {
        Test.StartTest();  
        Profile__c s=new Profile__c();              
        ApexPages.StandardController sc = new ApexPages.StandardController(s);
        Matrimony m = new Matrimony();
        m.newuser();
        Test.StopTest();
    }
    static testMethod void Registertest()
    {
        Test.StartTest();  
        Profile__c pro=[select id,Name,MailID__c,Password__c from Profile__c where MailID__c='saiteja@gmail.com'];
        integer i=[select count() from Profile__c where MailID__c='saiteja@gmail.com'];        
        Matrimony m = new Matrimony();
        PageReference pageRef = Page.Matrimonyui;
        pageRef.getParameters().put('Password',pro.Password__c);
        test.setCurrentPage(pageRef);
        system.assertEquals(i,1);
       
        m.istest=true;
         m.Register();
        Test.StopTest();
    }
   
    static testMethod void logout()
    {
        test.startTest();
        Matrimony m=new Matrimony();
        m.logout();
        Test.StopTest();        
    }
    static testMethod void backsearchPage()
    {
        test.startTest();
        Matrimony m=new Matrimony();
        m.backsearchPage();
        Test.StopTest();        
    }
   
    static testMethod void backhomePage()
    {
        test.startTest();
        Matrimony m=new Matrimony();
        m.backhomePage();
        Test.StopTest();        
    }
   
    static testMethod void backloginPage()
    {
        test.startTest();
        Matrimony m=new Matrimony();
        m.backloginPage();
        Test.StopTest();        
    }
    static testMethod void Myprofile()
    {
        test.startTest();
        Matrimony m=new Matrimony();
        m.Myprofile();
        Test.StopTest();        
    }    
    static testMethod void subbutton()
    {
        test.startTest();
        Matrimony m=new Matrimony();
        m.subbutton();
        Test.StopTest();        
    }

    public static testMethod void paymentif()
    {
        test.startTest();
        Matrimony m=new Matrimony();
        m.payment();
        m.istest=false;
        Test.StopTest();        
    }
    public static testMethod void paymentelse(){
        test.startTest();
        Matrimony m = new Matrimony();
        subscription__c sub=[select Name,CVV__c,Expiry_Date__c,Card_Number__c,username__c,Password__c,Mail_id__c from subscription__c where Mail_id__c='saiteja@gmail.com'];
        PageReference pageRef = Page.Matrimonyui;
        pageRef.getParameters().put('Name',sub.Name);
        pageRef.getParameters().put('Mail',sub.Mail_id__c);  
        pageRef.getParameters().put('username',sub.username__c);
        pageRef.getParameters().put('password',sub.Password__c);
        test.setCurrentPage(pageRef);
        m.istest=true;
        m.payment();
        test.stopTest();
    }
    static testMethod void Filtered_Searchif()
    {
        test.startTest();
        Matrimony m=new Matrimony();
        m.Filtered_Search();
        m.istest=True;
        Test.StopTest();        
    }
   
    static testMethod void ViewRecords()
    {
        test.startTest();
        Matrimony m=new Matrimony();
        m.ViewRecords();
        Test.StopTest();        
    }
    static testMethod void Search_Button()
    {
        test.startTest();
        Matrimony m=new Matrimony();
        m.Search_Button();
        Test.StopTest();        
    }
    static testMethod void update1()
    {
        test.startTest();
        Profile__c pro=[select id,Name,MailID__c,Password__c from Profile__c where MailID__c='saiteja@gmail.com'];
        pro.MailID__c='st@gmail.com';
        PageReference pageRef = Page.Matrimonyui;
        pageRef.getParameters().put('Password',pro.Password__c);
        update pro;
        system.debug('pro'+pro);
        Matrimony m=new Matrimony();
        m.istest=true;
        m.SaveDetails();
        integer c=[select count() from Profile__c where MailID__c='st@gmail.com'];
        system.assertEquals(c,1);
         Test.StopTest();        
    }
    static testMethod void getoccupation1()
    {
        test.startTest();
        Matrimony m=new Matrimony();
        m.getoccupation();
        Test.StopTest();        
    }
    static testMethod void getreligion1()
    {
        test.startTest();
        Matrimony m=new Matrimony();
        m.getreligion();
        Test.StopTest();        
    }
    static testMethod void getcaste1()
    {
        test.startTest();
        Matrimony m=new Matrimony();
        m.getcaste();
        Test.StopTest();        
    }
    static testMethod void getlocation1()
    {
        test.startTest();
        Matrimony m=new Matrimony();
        m.getlocation();
        Test.StopTest();        
    }
   
    public testmethod static void loginvalidationtest(){
        test.startTest();
        Matrimony m= new Matrimony();
        Profile__c pro=[select id,Name,MailID__c,Password__c,Address__c from Profile__c where MailID__c='saiteja@gmail.com'];
        PageReference pageRef = Page.Matrimonyui; // Add your VF page Name here
        pageRef.getParameters().put('mailid',pro.MailID__c);
        pageRef.getParameters().put('Password',pro.Password__c);
        Test.setCurrentPage(pageRef);
        m.istest=true;
        m.login();
        test.stopTest();
    }
    public testmethod static void loginvalidationiftest(){
       
        Test.startTest();
        Profile__c pro=[select id,Name,MailID__c,Password__c,Gender__c from Profile__c where MailID__c='saiteja@gmail.com'];
        Matrimony m= new Matrimony();
        PageReference pageRef = Page.Matrimonyui; // Add your VF page Name here
        pageRef.getParameters().put('mailid',pro.MailID__c);
        pageRef.getParameters().put('Password',pro.Password__c);
        // pageRef.getParameters().put('Gender',pro.Gender__c);
        Test.setCurrentPage(pageRef);
        Matrimony.profile_display PD=new Matrimony.profile_display();
        PD.Name = 'Test Wrapper';
        PD.Photo = 'Test Wrapper';
        PD.Occupation = 'Test Wrapper';
        PD.Religion = 'Test Wrapper';
        PD.id = 'Test Wrapper';
        PD.Caste = 'Test Wrapper';
        PD.Location ='Location';
        m.profiledisplayList[0].Name = 'fghjkl';
        m.istest=true;
        m.login();
        Test.stopTest();
    }
    public testmethod  static void loginvalidationelsetest(){
        Test.startTest();
        Profile__c pro=[select id,Name,MailID__c,Password__c from Profile__c where MailID__c='saiteja@gmail.com'];
        Matrimony m= new Matrimony();
        m.istest=false;
        m.login();
        Test.stopTest();
    }
    public testmethod  static void loginvalidationelse1test(){
        Test.startTest();
        Profile__c pro=[select id,Name,MailID__c,Password__c from Profile__c where MailID__c='saiteja@gmail.com'];
        PageReference pageRef = Page.Matrimonyui; // Add your VF page Name here
        pageRef.getParameters().put('mailid','saiteja@gmail.com');
        pageRef.getParameters().put('Password','epp');
        Test.setCurrentPage(pageRef);
        Matrimony m= new Matrimony();
        m.istest=false;
        m.login();
        Test.stopTest();
       
    }
    public testmethod  static void loginvalidationelse2test(){
        Test.startTest();
        Profile__c pro=[select id,Name,MailID__c,Password__c from Profile__c where MailID__c='saiteja@gmail.com'];
        PageReference pageRef = Page.Matrimonyui; // Add your VF page Name here
        pageRef.getParameters().put('mailid','saiteja@gmail.com');
       
        Test.setCurrentPage(pageRef);
        Matrimony m= new Matrimony();
        m.istest=false;
        m.login();
        Test.stopTest();
       
    }
  public testmethod static void viewprofile1(){
        test.startTest();
        Matrimony m= new Matrimony();
        subscription__c Sub=[select id,Name,Mail_id__c,Status__c from subscription__c where Mail_id__c='saiteja@gmail.com'];
      m.istest=false;
        m.View_Profile();
        test.stopTest();
    }
    public testmethod static void viewprofile1if(){
       
        Test.startTest();
        subscription__c Sub=[select id,Name,Mail_id__c,Status__c from subscription__c where Mail_id__c='saiteja@gmail.com'];
        system.debug('Sub'+Sub);
        Matrimony m= new Matrimony();
        PageReference pageRef = Page.Matrimonyui;
        pageRef.getParameters().put('mailid',Sub.Mail_id__c);
        Test.setCurrentPage(pageRef);
        m.istest=true;
        m.View_Profile();
        test.stopTest();
    }
}