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
  static targets = ['']
  static values = {}

  connect () {
    console.log('modal opening')
  }

  close () {
    this.element.remove()
  }
}
