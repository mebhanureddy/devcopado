public class Schedule_Apex_1 implements Schedulable {
    public void execute (SchedulableContext sc){
         future_apex_1.f1();
         system.debug('hi');
      /*  list<account> acclist=[select id,name from account];
        list<account> aclist=new list<account>();
        for (account a :acclist){
            a.phone='12345689';
            aclist.add(a);
        }
        update aclist;
        Batch_apex_1 ba=new  Batch_apex_1();
        Database.executeBatch(ba, 10); 
        Queable_apex_1 qa=new Queable_apex_1();
        system.enqueueJob(qa);*/        
    }    
}