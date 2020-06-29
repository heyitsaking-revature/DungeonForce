({
    setItems : function(component) {
        var index = component.get("v.index");
        var action = component.get("c.getCategoryItems");
        action.setParams({'index': index});
        action.setCallback(this, function(response) {
            console.log(response.getState());
            if(component.isValid() && response.getState() === "SUCCESS") {
                console.log("Returned items: ");
                console.log(response.getReturnValue());
                component.set("v.items", response.getReturnValue());
            }
        });
		$A.enqueueAction(action);
    }
})