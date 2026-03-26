trigger phoneupd on Account (before update) {
    map<id,account> accold=trigger.oldMap;
    map<id,account> accnew=trigger.newMap;
    list<contact> conlist=new list<contact>();
    set<id> myids =new set<id>();
    for(id i:accold.keySet()){
        if(accold.get(i).phone != accnew.get(i).phone){
            myids.add(i);
        }
    }
    for(contact c: [select id,HomePhone,OtherPhone,AccountId from contact where AccountId in: myids]){
        
        //account aold=accold.get(c.AccountId);
        //account anew=accnew.get(c.AccountId);
        c.HomePhone=trigger.oldMap.get(c.AccountId).Phone;
        c.OtherPhone=trigger.newMap.get(c.AccountId).Phone;
        conlist.add(c);
    }
    update conlist;
}