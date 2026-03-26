({
	Show : function(component) {
		var aval= component.find('aid').get('v.value');
        var bval= component.find('bid').get('v.value');
        component.set ("v.aval", parseInt(aval));
        component.set ("v.bval", parseInt(bval));
	}
})