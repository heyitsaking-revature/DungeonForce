({
    init: function (cmp, event, helper) {
        cmp.set('v.validate', function() {
            var values = {
                '15': false,
                '14': false,
                '13': false,
                '12': false,
                '10': false,
                '8': false
            }
            var allValid = cmp.find('abilityModifier').reduce(function (validSoFar, inputCmp) {
                var selected = inputCmp.get('v.value');
                var used = false;
                if(!values[selected]) {
                    values[selected] = true;
                } else {
                    used = true;
                }
                return validSoFar && !used;
            }, true);
            if(allValid) {
                return { isValid: true };
            }
            else {
                return { isValid: false, errorMessage: 'A value is missing or has been used more than once.'};
            }})
        helper.getInitialValues(cmp);
    }
});