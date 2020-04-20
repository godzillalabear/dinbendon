// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "icon" ]

  // initialize function is provided by stimulus
  initialize(){
    this.clicked = false;
  }

  heart(e){
  	e.preventDefault();

    if(this.clicked){
      this.iconTarget.classList.remove('fas');
      this.iconTarget.classList.add('far');
      this.clicked = false;
    }else {
      this.iconTarget.classList.remove('far');
      this.iconTarget.classList.add('fas');
      this.clicked = true;
    }
    
  }

  // it's like main controller, it will execute when ever we renew the page
  // connect() {
  //   // this.outputTarget.textContent = 'Hello, Stimulus!'
  //   console.log('hi 123');
  // }
}
