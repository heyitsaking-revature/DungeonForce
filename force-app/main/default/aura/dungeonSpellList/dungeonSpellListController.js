({
    doInit : function(component, event, helper) {
        helper.getSpellsList(component);
        helper.getInitials(component);
    },
    handleInitialTab: function (component, event, helper) {
        helper.getInitialSpells(component, event);
    }
})