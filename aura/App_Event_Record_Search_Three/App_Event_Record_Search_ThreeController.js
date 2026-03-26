({
	handleApplicationEvent1 : function(component, event, helper) {
		var action=component.get("c.opplist");
        component.set('v.columns', [
            {label: 'Related Opportunities', fieldName: 'Name', type: 'text',}
        ]);
        component.set("v.flag",true);
        var acid=event.getParam("accId");
        component.set("v.accId",acid);
        //alert(acid);
        //alert(component.get("v.accId"));
        action.setParams({
            oppid : acid
        });
        action.setCallback(this,function(response){
            component.set("v.data",response.getReturnValue());
            //alert(JSON.stringify(component.get("v.data")));
            console.log(component.get("v.data"));
        });
        
        $A.enqueueAction(action);
	}
})