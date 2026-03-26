({
    show : function(component, event, helper) {
       var name=component.get("v.name");
        var phone=component.get("v.phone");
        var industry=component.get("v.industry");
        var action=component.get("c.create");
        action.setParams({"name":name,"phone":phone,"industry":industry});
        action.setCallback(this,function(response){
            var result=response.getReturnValue();
			component.set("v.result",result);
        });
        $A.enqueueAction(action);
	}
})