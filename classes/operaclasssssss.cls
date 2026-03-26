public class operaclasssssss {
    public integer a {set;get;}
    public integer b {set;get;}
    public integer c {set;get;}
    public String operation {set;get;}
    
        public void add(){
        c=a+b;
        operation='ADDITION' ;   
        system.debug(+c);
        }
      public void sub(){
        c=a-b;
        system.debug(+c);
          operation='SUBTRACTION' ;
        }
      public void mul(){
        c=a*b;
        system.debug(+c);
          operation='MULTIPLICATION' ;
        }
    public pageReference div(){
        c=a/b;
        system.debug(+c);
        operation='DIVISION' ;
        return null;
        }
}