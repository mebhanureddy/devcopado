({
	ShowContacts : function(component, event, helper) {
        var action=component.get('c.AccountRelatedContacts');
         action.setCallback(this,function(a){
            var state = a.getState();
            console.log('state ='+state);
            if (component.isValid() && state === "SUCCESS") {
               
                component.set("v.AccCont", a.getReturnValue());
                console.log(a.getReturnValue())
              }
        });$A.enqueueAction(action);
	}
})