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
  static targets = ['form', 'trigger']
  static values = { event: String }

  connect () {
    if (this.hasTriggerTarget) {
      this.triggerTargets.forEach((element) => {
        element.addEventListener(this.eventValue, () => { this.formTarget.requestSubmit() })
      })
    } else {
      this.formTarget.addEventListener(this.eventValue, () => { this.formTarget.requestSubmit() })
    }
  }
}
