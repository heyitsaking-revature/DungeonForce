({
    getClassInfo : function(component) {
        var action = component.get("c.getClassInfo");
        action.setParams({"index": component.get("v.class").toLowerCase()})
        action.setCallback(this, function(response) {
            if(component.isValid() && response.getState() === "SUCCESS") {
                component.set("v.information", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);		
    }
})