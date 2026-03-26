({
	show : function(component, event, helper) {
  	var action=component.get("c.callMe");
        var fname=component.find("firstname").get("v.value");
        var lname=component.find("lastname").get("v.value");
        action.setParams({firstname:fname,lastname:lname});
        action.setCallback(this,function(abc){
            component.set("v.result",abc.getReturnValue());
        });
        $A.enqueueAction(action);
        
        /*   var lname=component.find("firstname").get("v.value");
        alert(lname);
         var fname=component.find("lastname").get("v.value");
        var result= lname+fname;
        alert(result);
        component.set("v.result",result);*/
	}
})