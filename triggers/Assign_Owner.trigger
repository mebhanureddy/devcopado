trigger Assign_Owner on Account (before insert,before update) {
    User u =[select id from user where username = 'integration@00d2v000001wkodeam.com'];
        for(Account a: Trigger.new)
    {
        if (a.Industry=='Education'){
            a.OwnerId=u.Id;
        }
    }
}