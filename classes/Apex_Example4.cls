public class Apex_Example4 {
	Public string  stageName;
    Public string typeName;
    Public Date closeDate;
    Public void hey(){
        if(typeName=='New Customer'){
            stageName='Prospecting';
            closeDate=System.today()+15;
        }else{
            stageName='Closed Won';
            closeDate=System.today();
        }
    }
}