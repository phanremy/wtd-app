class AhoyVisitResource < Avo::BaseResource
  self.model_class = Ahoy::Visit
  self.title = :id
  self.includes = []
  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], as: :text m: "or").result(distinct: false)
  # end

  field :id, as: :text, as: :id
  field :visit_token, as: :text
  field :visitor_token, as: :text
  field :user_id, as: :text
  field :ip, as: :text
  field :referrer, as: :text
  field :referring_domain, as: :text
  field :landing_page, as: :text
  field :browser, as: :text
  field :os, as: :text
  field :device_type, as: :text
  field :user_agent, as: :text
  field :country, as: :text
  field :region, as: :text
  field :city, as: :text
  field :latitude, as: :text
  field :longitude, as: :text
  field :utm_source, as: :text
  field :utm_medium, as: :text
  field :utm_term, as: :text
  field :utm_content, as: :text
  field :utm_campaign, as: :text
  field :app_version, as: :text
  field :os_version, as: :text
  field :platform, as: :text
  field :started_at, as: :text
end
