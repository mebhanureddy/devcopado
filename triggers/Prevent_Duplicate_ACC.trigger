trigger Prevent_Duplicate_ACC on Account (before insert) {
    for(account a:trigger.new){
        list <Account> acc = [Select id from Account where Name=:a.Name];
        if(acc.size()>0){
            a.Name.adderror('You cant add duplicate account');
        }
    }
}