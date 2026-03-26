trigger ex1doc on Account (before insert) {
    for(Account a: Trigger.new){
        if (a.Industry=='Banking'){
            a.phone='888';
        }
    }
}