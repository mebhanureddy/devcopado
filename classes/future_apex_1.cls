public class future_apex_1 {
@future
    public static void f1(){
        list<Account> aclist=new list<Account>();
        list<Account> acclist=[select id,name,phone from Account];
        for (Account a:acclist){
            a.phone='';
            aclist.add(a);
        }
        update(aclist);
    }
   
}