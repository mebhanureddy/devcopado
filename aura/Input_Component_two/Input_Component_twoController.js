({
	add : function(component, event, helper) {
        helper.Show(component);
        var aval = component.get('v.value');
        var bval = component.get('v.value');
        var result = aval+bval;
        component.set('v.result', result);
	},
    mul : function(component, event, helper) {
		var aval = component.get('v.value');
        var bval = component.get('v.value');
        var result = aval*bval;
        component.set('v.result', result);
	}
})