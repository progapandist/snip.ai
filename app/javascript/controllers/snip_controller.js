import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form", "wait", "field", "submit", "buttonText"];

  onPostSend() {
    this.fieldTarget.disabled = true;
    this.submitTarget.disabled = true;
    this.buttonTextTarget.innerText = "🤖...";
    this.buttonTextTarget.classList.add("animate-ping");
    this.fieldTarget.classList.add("bg-gray-100");
  }
}
