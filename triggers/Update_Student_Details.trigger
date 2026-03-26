trigger Update_Student_Details on Student__c (after insert,after update) {
    list<Student__c> std = [select id,course__c,college__r.no_of_students__c,college__r.CSE__c,college__r.ECE__c,college__r.IT__c 
                            from Student__c where id in:trigger.new ];
    map<string,id> stlist = new map<string,id>();
    list<college__c> cll = new list<college__c>();
    if(trigger.isAfter && trigger.isInsert){
        for(Student__c s:std){
            stlist.put(s.course__c,s.college__r.id);
        }
        list<college__c> clg =[select CSE__c,ECE__c,IT__c,id from college__c where id in:stlist.values()];
        for(college__c cl:clg){
            if(stlist.containsKey('ECE')){
                cl.ECE__c= cl.ECE__c+1;
            }
            if(stlist.containsKey('CSE')){
                cl.CSE__c= cl.CSE__c+1;
            }
            if(stlist.containsKey('IT')){
                cl.IT__c= +1;
            }cll.add(cl);
        }
        update cll;
        
    }
}