public with sharing class successerror
{    
    public Account acc{get;set;}    
    public successerror(ApexPages.StandardController controller){        
    acc = new Account();
    }
        public void save()
        {    
               if(acc.name == ''|| acc.name == null|| acc.phone == null){
           ApexPages.Addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please enter Account name'));
        }
            else
        {
               insert acc;
             ApexPages.AddMessage(new ApexPages.Message(ApexPages.severity.CONFIRM,'Record Created Successfully.Thank you!'));
        }  
    }
}