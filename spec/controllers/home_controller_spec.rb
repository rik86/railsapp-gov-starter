require "rails_helper"

RSpec.describe HomeController, type: :controller do
  context "when the index path is requested" do
    it "should render the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
