Rails.application.routes.draw do
  get 'static_fusioncharts/index'

  get 'fusioncharts/index'
  get 'fusioncharts/drilldown'
  #get 'http://localhost:3000/newchart-json-/q1' => redirect('fusioncharts/drilldown')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
