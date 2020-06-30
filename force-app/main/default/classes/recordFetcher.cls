public class recordFetcher {
	static Id userId = UserInfo.getUserId();
    
    @AuraEnabled
    public static Object[] getUserCharacters() {
        List<Character__c> characters = [SELECT Id, Name, Experience__c,
                                         Class__c, Race__c, Strenght__c,
                                         Dexterity__c, Constitution__c,
                                         Intelligence__c, Wisdom__c,
                                         Charisma__c, Level__c,
                                         Proficiency_Bonus__c, Subrace__c 
                                         FROM Character__c WHERE CreatedById = :userId];
        return characters;
    }
    
    @AuraEnabled
    public static Object[] getUserCampaigns() {
        List<Campaign__c> campaigns = [SELECT Id, Name, CreatedDate, Notes__c 
                                         FROM Campaign__c WHERE CreatedById = :userId];
        return campaigns;
    }
}