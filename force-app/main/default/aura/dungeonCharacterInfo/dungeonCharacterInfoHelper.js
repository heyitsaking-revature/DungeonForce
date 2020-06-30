({
    getUserCharacters : function(component) {
        var action = component.get("c.getUserCharacters");
        action.setCallback(this, function(response) {
            if(component.isValid() && response.getState() === "SUCCESS") {
                component.set("v.characterRecords", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})