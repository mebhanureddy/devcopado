public class Queable_apex_1 implements Queueable {
    public void execute(QueueableContext qc){
       list<account> acclist=[select id,name from account];
        list<account> aclist=new list<account>();
        for (account a :acclist){
            a.phone='9553211';
            aclist.add(a);
        }
        update aclist;
    }
}