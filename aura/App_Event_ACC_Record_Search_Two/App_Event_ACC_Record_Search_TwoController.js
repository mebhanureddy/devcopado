({
	handleApplicationEvent : function(component, event, helper) {
		var action=component.get("c.conlist");
        component.set('v.columns', [
            {label: 'Related Contacts', fieldName: 'LastName', type: 'text',}
        ]);
        component.set("v.flag",true);
        var acid=event.getParam("accId");
        component.set("v.accId",acid);
        //alert(acid);
        //alert(component.get("v.accId"));
        action.setParams({
            conid : acid
        });
        action.setCallback(this,function(response){
            component.set("v.data",response.getReturnValue());
            //alert(JSON.stringify(component.get("v.data")));
            console.log(component.get("v.data"));
        });
        
        $A.enqueueAction(action);
	}
})