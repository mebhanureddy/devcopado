public class Apex_C8 {
@AuraEnabled
    public static Id Invoke(Account Acc, Contact Con, Opportunity Opp)
    {
         id result;
        SavePoint SP=Database.setSavepoint();
        Try{
            insert Acc;
            insert Con;
            insert Opp;
            result=Acc.Id;
        }
        Catch(Exception e){
            Database.rollback(SP);
        }   
        return result;
        }
    
}