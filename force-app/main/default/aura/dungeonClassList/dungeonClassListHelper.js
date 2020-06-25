({
    getClassesList : function(component) {
        var action = component.get("c.getClasses");
        action.setCallback(this, function(response) {
            if(component.isValid() && response.getState() === "SUCCESS") {
                component.set("v.classes", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})