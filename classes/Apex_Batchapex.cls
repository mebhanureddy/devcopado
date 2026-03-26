public class Apex_Batchapex implements Database.Batchable<sObject>
{
    public Database.QueryLocator start(Database.BatchableContext bcon)
    {
        string query='select name from account';
        return Database.getQueryLocator(query);
    }
    public void execute (Database.BatchableContext bcon, list<account> scope)
    {
        List <Opportunity> opplist =new List <Opportunity>();
        for(Account acc : scope)
        {
            for(integer i=0;i<10;i++){
                Opportunity op=new Opportunity();
                op.Name='shara'+i;
                op.CloseDate=system.today()+10;
                op.StageName='Prospecting';
                opplist.add(op);
            }
        }
        insert opplist;
    }
    public void finish(Database.BatchableContext bcon){
        
    }
}