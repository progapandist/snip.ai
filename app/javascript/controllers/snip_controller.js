import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form", "wait", "field", "submit", "buttonText"];

  onPostSuccess(event) {
    let [data, status, xhr] = event.detail;
    console.log(data, status, xhr);

    this.fieldTarget.disabled = true;
    this.buttonTextTarget.innerText = "☎️ ...";
    this.buttonTextTarget.classList.add("animate-ping");
    this.fieldTarget.classList.add("bg-gray-100");
  }

  connect() {
    console.log("Hello, Stimulus!");
  }
}
