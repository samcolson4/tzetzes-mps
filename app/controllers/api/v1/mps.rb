module API
  module V1
    class Mps < Grape::API
      include API::V1::Defaults
      resource :users do
        desc "Return all MPs"
        get "" do
          Mp.all
        end
      desc "Return an MP"
        params do
          requires :id, type: String, desc: "ID of the MP"
        end
        get ":id" do
          Mp.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end
