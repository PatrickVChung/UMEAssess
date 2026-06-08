import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  close() {
    window.open('', '_self', '');
    window.close();
  }
}
