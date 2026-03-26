public class EmployeList{
    @auraEnabled
    public static list<sObject> getData (string param)
    {
        string Query='';
       if(param!=Null){
           Query='select Id, Name from '+param;
           system.debug('dsfds'+Query);
       }
       list<sObject> sobjectlist =Database.query(Query);
        system.debug('dsfds'+sobjectlist);
       return sobjectlist;
    }
}