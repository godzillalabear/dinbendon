// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import axios from "axios"

export default class extends Controller {
  static targets = [ "icon" ]

  // initialize function is provided by stimulus
  initialize(){
    this.clicked = false;
  }

  heart(e){
  	e.preventDefault();

    //api request
    const csrfToken = document.querySelector('[name=csrf-token]').content
    axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken
    
    let item_id = document.querySelector('#item_id').value;
    // console.log(item_id);

    axios.post(`/api/v1/items/${item_id}/favorite`)
      .then(resp => {
        if(resp.data.status === "favorited"){
          this.iconTarget.classList.remove('far');
          this.iconTarget.classList.add('fas');
        }else{
          this.iconTarget.classList.remove('fas');
          this.iconTarget.classList.add('far');
        }
      })
      .catch(err => {
        console.log(err);    
      })

    

    // if(this.clicked){
    
    //   this.clicked = false;
    // }else {
    //   this.iconTarget.classList.remove('far');
    //   this.iconTarget.classList.add('fas');
    //   this.clicked = true;
    // }
    
  }

  // it's like main controller, it will execute when ever we renew the page
  // connect() {
  //   // this.outputTarget.textContent = 'Hello, Stimulus!'
  //   console.log('hi 123');
  // }
}
