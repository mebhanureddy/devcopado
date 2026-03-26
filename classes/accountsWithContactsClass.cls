public class accountsWithContactsClass {
@auraEnabled
   public static List<Account> getAccRec()
  {
       List<Account> acc=[Select id,Name,Phone,Type from Account];
      return acc;
   }

}