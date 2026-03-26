trigger Acc_Rating_Hot_Create_TeamMember_as_AccTeamMember on Account (after update) {
    Map<id,Account> OldAccList =new Map<id,Account>();
    Map<id,Account> NewAccList =new Map<id,Account>();
}