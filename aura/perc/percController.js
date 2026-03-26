({
	doclick : function(component, event, helper) {
		alert(component.isValid ());
        alert(component.getName ());
        alert(component.get('v.name'));
        component.set('v.name',"Reddy")
	}
})