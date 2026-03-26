trigger opp on Opportunity (before insert) {
    list<opportunity> op= [select id, stagename, account.rating from opportunity where id in:trigger.new];
    list<account>acc = new list<account>();
    for(opportunity opp:op){
        if(opp.stagename=='closed won'){
            opp.account.rating='hot';
            acc.add(opp.account);
        }
    }update acc;
}