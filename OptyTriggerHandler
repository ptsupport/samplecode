global class OptyTriggerHandler extends pform.TriggerHandler {
    
    public override void beforeUpdate() {
        List<Opportunity> oppList = (List<Opportunity>) Trigger.new;        
		    System.debug(LoggingLevel.DEBUG,'>>>OptyTriggerHandler BEFOREUPDATE CALLED: ' + oppList.size());
        
        // Could Enable the Approvals-Framework for automating list/hierarchy of approval process users on Opportunity:
        // pform.ApprovalHierarchyHandler.updateApprovalFields(oppList);
		    // System.debug(LoggingLevel.DEBUG,'>>>OptyTriggerHandler: ApprovalHierarchyHandler.updateApprovalFields COMPLETED');
        
        try {
            Opportunity opp = oppList[0];
        	  Account acct = [SELECT ID,NAME,Industry,Description FROM ACCOUNT WHERE ID =: opp.AccountId LIMIT 1];
            
            // the following code is not bulkified to simplify the demo 
            String archiveResultStr = null;   
            archiveResultStr = (String) pform.Rules.evaluate('ArchiveOpportunity', oppList[0]);
			      System.debug('>>>OptyTriggerHandler: ArchiveOpportunity RULES RESULT: ' + archiveResultStr);
            if (archiveResultStr != null && archiveResultStr.equalsIgnoreCase('Archive')) {
                pform.ErrorHandler.logError('INFO', ':OptyTriggerHandler.beforeUpdate', 'Archive Result: ' + archiveResultStr);                 
            }

            String acctCriteriaStr = (String) pform.Rules.evaluate('AccountCriteria', acct);
			      System.debug('>>>OptyTriggerHandler: AccountCriteria RULES RESULT: ' + acctCriteriaStr);
            if (acctCriteriaStr != null && acctCriteriaStr.equalsIgnoreCase('Approved')) {
                pform.ErrorHandler.logError('INFO', ':OptyTriggerHandler.beforeUpdate', 'AccountCriteria Result: ' + acctCriteriaStr);                 
            }            
        } catch (Exception exc) {
            pform.ErrorHandler.logError(exc);
        }        
    }
}
