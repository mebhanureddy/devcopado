({
	calAmount: function(component, event, helper) {
        var amount=component.get('v.amount');
        console.log("amount",+amount);
        var rate=component.get('v.rate');
        console.log("rate",+rate);
        var years=component.get('v.years');
        console.log("years",+years);
        var Interest=(amount*rate*years)/100;
        console.log("Interest",+Interest);
        component.set("v.Interest",Interest);		
	}
})