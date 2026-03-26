({
	doClick : function(component, event, helper) {
        var initialABCValue=component.get("v.abc");
        if(initialABCValue == "true"){
            alert("Value is True");
            component.set("v.abc", "false");
        }
        else{
            alert("Value is False");
            component.set("v.abc", "true");
        }
	} ,  
   onClickCheckBox : function(component, event, helper) {
        console.log("This is controller");
        helper.onClickCheckBoxHelper(component, event);
    }
})