import { LightningElement } from 'lwc';
export default class QuizApp extends LightningElement {
selectedValues={}  //selected values
correctAnswers= 0  //to store num of correct answers
isSubmitted = false  // to show number of correct answers
     myQuestions =[   
        {
        id:"Question1",
        question:"Which one of the following template is not a loop?",
        answers: {a:"for each",
                  b:"iteration",
                  c:"map loop"},
          correctanswer:"c"
        },
        {
            id:"Question2",
            question:"Which one of the following file is not in LWC?",
            answers: {a:".svg",     
                      b:".apex",
                      c:".js"},
              correctanswer:"b"
            },
            {
                id:"Question3",
                question:"Which one of the following is not a directive?",
                answers: {a:"for each",
                          b:"if:true",
                          c:"@track"},
                  correctanswer:"c"
                }
    ]

    changeHandler(event){
        console.log("name", event.target.name)
        console.log("value", event.target.value)
        const {name,value}= event.target
        this.selectedValues={...this.selectedValues,[name]:value}
    }

    submitHandler(event){
      event.preventDefault()
      let correct = this.myQuestions.filter(item=>this.selectedValues[item.id]=== item.correctanswer)
      this.correctAnswers = correct.length
      this.isSubmitted=true
      console.log("Correct answers",this.correctAnswers)
    }

    resetHandler(){
      this.selectedValues={}
      this.correctAnswers=0
      console.log("Page Reset Selected values",this.selectedValues.length)
    }

    get  allNotSelected(){
      return !(Object.keys(this.selectedValues).length===this.myQuestions.length)
    }
}