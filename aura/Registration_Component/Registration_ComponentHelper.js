({
	onClickCheckBoxHelper : function(component, event) {
          console.log("This is Helper");
		var checkBoxValue = component.find("CheckBox").get("v.checked");
        component.set("v.CheckBoxValue", checkBoxValue);
	}
})