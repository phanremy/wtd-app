// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import { Application } from "@hotwired/stimulus"

import ModalController from "./controllers/modal_controller"
import TriggerFormController from "./controllers/trigger_form_controller"

window.Stimulus = Application.start()
Stimulus.register("modal", ModalController)
Stimulus.register("trigger-form", TriggerFormController)
