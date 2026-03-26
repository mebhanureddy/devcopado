public class SaveRedirectclass {

/*registration redirect*/ 
		Profile__c Profile;
		private ApexPages.StandardController controller;
		public SaveRedirectclass(ApexPages.StandardController controller) {
        this.controller = controller;
        }
        public PageReference save1() {
        insert Profile;
        PageReference newpageclassvff = new PageReference('/apex/loginvf');
        newpageclassvff.setRedirect(true);
        return newpageclassvff;
        }
}