import { LightningElement, track , wire} from 'lwc';
export default class LogicalLwcDemo extends LightningElement {
@track greeting="Hi! Welcome Bhanu";
@track message="Available Resources:";
@track contacts = [
{
    Id:'43389909398',
    name:'Raju'
},
{
    Id:'43389909376',
    name:'Daniel'
},
{
    Id:'43389909399',
    name:'zack'
}
];
}