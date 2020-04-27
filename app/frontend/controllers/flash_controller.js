// flash_controller.js


import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["message"]

  // connect(){
  // 	console.log('cc');
  // };

  close(e){
  	e.preventDefault();
  	this.messageTarget.remove();
  	// console.log('close');
  }

}