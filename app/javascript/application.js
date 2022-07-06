// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import { Application } from "@hotwired/stimulus"

import ModalDisplayController from "controllers/modal_display_controller"
import ModalOpenController from "controllers/modal_open_controller"
import TriggerFormController from "controllers/trigger_form_controller"
import SlimSelectController from "controllers/slim_select_controller"

window.Stimulus = Application.start()
Stimulus.register("modal-display", ModalDisplayController)
Stimulus.register("modal-open", ModalOpenController)
Stimulus.register("trigger-form", TriggerFormController)
Stimulus.register("slim-select", SlimSelectController)
