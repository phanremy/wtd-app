import { Controller } from '@hotwired/stimulus'

/*
 * Values:
 *
 * Notes:
 *
 * Example:
 *
 */
export default class extends Controller {
  static targets = ['modal']

  process () {
    document.getElementById('main').insertAdjacentHTML('afterbegin', this.modalTarget.innerHTML)
  }
}
