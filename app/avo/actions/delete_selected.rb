class DeleteSelected < Avo::BaseAction
  self.name = 'Delete selected'

  def handle(**args)
    models = args.values_at(:models)
    # models, fields, current_user, resource = args.values_at(:models, :fields, :current_user, :resource)

    models.flatten.each(&:destroy)
  end
end
