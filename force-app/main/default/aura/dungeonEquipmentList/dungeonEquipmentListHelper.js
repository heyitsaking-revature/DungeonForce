({
    getWeaponTypes : function(component) {
        var action = component.get("c.getWeaponTypes");
        action.setCallback(this, function(response) {
            if(component.isValid() && response.getState() === "SUCCESS") {
                component.set("v.weapons", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    getArmorTypes : function(component) {
        var action = component.get("c.getArmorTypes");
        action.setCallback(this, function(response) {
            if(component.isValid() && response.getState() === "SUCCESS") {
                component.set("v.armor", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})