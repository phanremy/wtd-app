class AhoyEventResource < Avo::BaseResource
  self.model_class = Ahoy::Event
  self.title = :id
  self.includes = []
  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  action DeleteSelected

  field :id, as: :id
  field :visit_id, as: :id
  field :user_id, as: :id
  field :name, as: :text
  field :time, as: :text
  field :properties, as: :text
  # add fields here
end
