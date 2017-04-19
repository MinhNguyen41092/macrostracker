class Api::V1::InformationsController < Api::V1::BaseController
  def show
    information = Information.find(params[:id])
    
    render(json: Api::V1::InformationSerializer.new(information).to_json)
  end
end
