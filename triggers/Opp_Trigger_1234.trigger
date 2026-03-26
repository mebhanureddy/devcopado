trigger Opp_Trigger_1234 on Opportunity (after insert,before update,before delete) {
    if(Trigger.isafter && Trigger.isinsert){
	map<id,Decimal> mymap=new map<id,Decimal>();
        for(Opportunity o: Trigger.new){
            if(o.AccountId != null && o.Amount != null){
               Decimal oppTotal =0;
                oppTotal= oppTotal+o.Amount;
                mymap.put(o.AccountId,oppTotal);
                system.debug('mymap'+mymap);
            }
        }
        List<Account> acclist=[select id,AnnualRevenue from account where id in:mymap.keyset()];
        system.debug('records  '+acclist);
        for(account a: acclist){
            a.AnnualRevenue+=mymap.get(a.id);
        }
        system.debug('acclist'+acclist);
        update acclist;
    }
/*if(Trigger.isbefore && Trigger.isupdate){
        for(Opportunity o:trigger.new){
            if(o.AccountId != null && o.Amount != null){
                
            }
        }
    }*/
}