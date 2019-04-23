Rails.application.routes.draw do
  scope :v1 do
    post "/graphql", to: "graphql#execute"
  end
end
