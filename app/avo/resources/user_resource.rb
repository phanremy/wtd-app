class UserResource < Avo::BaseResource
  self.title = :email
  self.includes = []
  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  field :email, as: :text
  field :password, as: :password
  field :admin, as: :boolean
  # add fields here
end
