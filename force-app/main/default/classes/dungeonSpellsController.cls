public class dungeonSpellsController {
    
    static String baseUrl = 'https://www.dnd5eapi.co/api/spells/';

    @AuraEnabled
    public static Object[] getSpells(){
        Http h = new Http();
        HttpRequest spellsRequest = new HttpRequest();
        spellsRequest.setEndpoint(baseUrl);
        spellsRequest.setMethod('GET');

        HttpResponse spellsResponse = h.send(spellsRequest);
        Map<String, Object> spellsResults = (Map<String, Object>) JSON.deserializeUntyped(spellsResponse.getBody());
        
        System.debug(spellsResults.get('results'));
        return (List<Object>) spellsResults.get('results');
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