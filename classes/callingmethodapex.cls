public class callingmethodapex {
    public Integer id{set;get;}
    public String name{set;get;}
    public String city{set;get;}
    public String company{set;get;}
    public void one()
    {
        id=20;
        city='Hyd';
        company='Ariston';
  		
    }
    public void two()
    {
        one();
        name='Bhanu';             
    }
}