import { Controller } from '@hotwired/stimulus'
import SlimSelect from 'slim-select'

/*
 * Values:
 *
 * Notes:
 *
 * Example:
 *
 */
export default class extends Controller {
  static targets = ['select']
  static value = ['placeholder']

  connect () {
    console.log('controller connected')
    this.select = this.fillSelect()
  }

  fillSelect () {
    return new SlimSelect({
      select: this.selectTarget,
      placeholder: this.placeholderValue
    })
  }
}
