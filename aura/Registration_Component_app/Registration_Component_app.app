<aura:application extends="force:slds" >
    <aura:attribute name="OpenRegistrationForm" type="Boolean" default="False" />
    <aura:attribute name="ButtonLabel" type="String" default="Open" />
    
    <lightning:button label="{!v.ButtonLabel}" onclick="{!c.OpenORCloseRegistrationForm}" />
    
    <aura:if isTrue="{!v.OpenRegistrationForm}">
        <c:Registration_Component />	
    </aura:if>
</aura:application>