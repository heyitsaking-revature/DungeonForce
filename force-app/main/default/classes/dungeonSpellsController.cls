public class dungeonSpellsController {
    
    static String baseUrl = 'https://www.dnd5eapi.co/api/spells/';
    
    @AuraEnabled
    public static String[] getSpells(){
        Http h = new Http();
        HttpRequest spellsRequest = new HttpRequest();
        spellsRequest.setEndpoint(baseUrl);
        spellsRequest.setMethod('GET');
        
        HttpResponse spellsResponse = h.send(spellsRequest);
        Map<String, Object> spellsResults = (Map<String, Object>) JSON.deserializeUntyped(spellsResponse.getBody());
        
        String[] spells = new String[]{};
            
            for(Object result : (List<Object>) spellsResults.get('results')) {
                Map<String,Object> curSpell = (Map<String,Object>) result;
                spells.add((String)curSpell.get('name'));
            }
        return (List<String>) spells;
    }
    
    @AuraEnabled
    public static String[] getSpellInitials(){
        String[] spells = dungeonSpellsController.getSpells();
        String[] spellInitials = new String[]{};
            
            for(String spell : spells) {
                String spellInitial = spell.substring(0,1);
                if(!spellInitials.contains(spellInitial)){
                    spellInitials.add(spellInitial);
                }
            }
        
        return spellInitials;
    }
    
    @AuraEnabled
    public static Object getSpellInfo(String index) {
        Http h = new Http();
        HttpRequest spellInfoRequest = new HttpRequest();
        spellInfoRequest.setEndpoint(baseUrl + index);
        spellInfoRequest.setMethod('GET');
        
        HttpResponse spellInfoResponse = h.send(spellInfoRequest);
        Map<String, Object> spellInfoResults = (Map<String, Object>) JSON.deserializeUntyped(spellInfoResponse.getBody());
        
        return (Object) spellInfoResults;
    }
}