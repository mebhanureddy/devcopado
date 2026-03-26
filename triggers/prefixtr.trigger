trigger prefixtr on Account (before insert) {
    for (Account a: Trigger.new){
        a.Name='Company'+a.name;
    }
}