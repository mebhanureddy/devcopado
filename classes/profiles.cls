public class profiles {
public list<Profile__c> pro {get;set;}
Public profiles(){
pro = [Select Name from Profile__c];  
}
}