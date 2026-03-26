//update acount rating on opportunity stage = 'closed won'
trigger UpdateRatingwhenratingisClosedWon on Opportunity (after insert,after update) {
    map<id,id> oppmap = new map<id,id>();
    list<account> a = new list<account>();
    for(opportunity opp:trigger.new){
        if(opp.stageName == 'closed won'){
            oppmap.put(opp.id,opp.accountid)    ;
        }
    }
    list<account> acc = new list<account>([select id,Rating from account where id=:oppmap.values()]);
    for(account ac:acc){
        ac.Rating='hot';
        a.add(ac);
    }
    update a;
}