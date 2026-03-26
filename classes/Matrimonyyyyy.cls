public with sharing class Matrimonyyyyy {
    public Boolean displayPopup {get;set;}
    public  Profile__c accs {get;set;}
     public Profile__c user_Obj{get; set;}
    public Matrimonyyyyy() {
    }
    public void showPopup()
    {
    displayPopup = true;
    }
    public void closePopup() {
        displayPopup = false;
    }
    public PageReference redirectPopup()
    {
    displayPopup = false;
        //Please uncomment below 3 statements and replace YourObjectId
        PageReference p=new Pagereference('/'+accs);
         p.setRedirect(true);
         return p;
    }
}