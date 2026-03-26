global class Batch_apex_1 implements Database.Batchable<sobject>,database.stateful {
   global list<opportunity> opp=new list<opportunity>();
    
    global Iterable<sObject> start(Database.BatchableContext bc){
         list<opportunity> opp = [select id,name from opportunity];
          return opp;
    }
    global void execute(Database.BatchableContext bc,list<Opportunity> oplist){
        for(Opportunity o: oplist){
            o.stageName='prospecting';
            opp.add(o);
            system.debug('opp '+o);
        }
        update opp;
    }
    global void finish(Database.BatchableContext bc){
        //future_apex_1.f1();
        System.debug('future is executed');
    }
}