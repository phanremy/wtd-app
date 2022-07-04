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
  static targets = ['background', 'panel']

  initialize () {
    this.dynamicDisplay()
  }

  dynamicDisplay () {
    setTimeout(() => {
      this.backgroundTarget.classList.remove('opacity-0')
      this.backgroundTarget.classList.add('opacity-100')
    }, 100)
    setTimeout(() => {
      this.panelTarget.classList.remove('opacity-0')
      this.panelTarget.classList.remove('translate-y-4')
      this.panelTarget.classList.remove('sm:translate-y-0')
      this.panelTarget.classList.remove('sm:scale-100')
      this.panelTarget.classList.add('opacity-100')
      this.panelTarget.classList.add('translate-y-0')
      this.panelTarget.classList.add('sm:scale-100')
    }, 300)
  }

  close () {
    this.element.remove()
  }
}
