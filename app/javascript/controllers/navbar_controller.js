import { Controller } from 'stimulus';
export default class extends Controller {
  connect() {
    console.log(window.innerHeight)
  }

  updateNavbar() {
    if (window.scrollY >= 300) {
      this.element.classList.add("navbar-black")
    } else {
      this.element.classList.remove("navbar-black")
    }
  }
}
