trigger Delete_Addresss on Company__c (before delete) {
    list<id> idList=new list<id>();
    List<Employee__c> Employeelist = new List<Employee__c>();
    for(company__c COM : trigger.old)
    {
        idList.add(COM.id);
    }
    list<employee__c> epList=[select id, Address__c, company1__c, company2__c, company1__r.Address__c, company2__r.Address__c 
                              from employee__c where company1__r.id IN:idList OR company2__r.id IN:idList];
    if (epList.size() > 0 )
    {
        for ( Employee__c employee : epList )
        {
            if((employee.company1__r.Address__c == null) && (employee.company2__r.Address__c== null) )
            {
                employee.Address__c= null;
            }
            else
            {
                if(employee.company1__r.Address__c== null )
                {
                    employee.Address__c= employee.company2__r.Address__c;
                }
                else
                {
                    if(employee.company2__r.Address__c== null){
                        employee.Address__c= employee.company1__r.Address__c;
                    }
                } 
            }
            Employeelist.add(employee);
        }
        update Employeelist;
    }
}