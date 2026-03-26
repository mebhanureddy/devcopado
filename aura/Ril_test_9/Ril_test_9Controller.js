({
	onfocus : function(component, event, helper) {
		var a=component.find("v.onfocus");
        $A.util.addClass(a,'focus');
	},
    onblur : function(component, event, helper) {
		var v=component.find("v.onblur");
         $A.util.addClass(v,'blur');
	},
})