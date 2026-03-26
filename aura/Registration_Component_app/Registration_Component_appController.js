({
	OpenORCloseRegistrationForm : function(component, event, helper) {
        var a = event.getSource().get("v.label");
        if (a == "Open"){
            component.set ("v.OpenRegistrationForm" , true);
            component.set ("v.ButtonLabel" , "Close");
        }
         else {
            component.set ("v.OpenRegistrationForm" , false);
            component.set ("v.ButtonLabel" , "Open");
        }
	}
})