// comment_controller.js

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["content", "submit"]

  // connect(){
  // 	console.log('cc');
  // };

  check(e){
  	if(this.contentTarget.value.length >= 2){
  		this.submitTarget.disabled = false;
  	}else{
  		this.submitTarget.disabled = true;	
  	}
  }

}