({
	show : function(component, event, helper) {
		var action=component.get("c.calculateinterest");
        var pa=component.find("pamount").get("v.value");
        var r=component.find("rate").get("v.value");
        var y=component.find("years").get("v.value");
        action.setParams({principal:pa,rate:r,years:y});
        action.setCallback(this,function(response){
            component.set("v.result",action.getReturnValue());
        });
        $A.enqueueAction(action);
	}
})