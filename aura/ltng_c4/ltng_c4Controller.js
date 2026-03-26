({
	show : function(component, event, helper) {
		var action=component.get('c.callMe');
        action.setCallback(this,function(response){
            var result=response.getReturnValue();
            component.set("v.data",result);
            alert(JSON.stringify(result));
        });
        $A.enqueueAction(action);
	}
})