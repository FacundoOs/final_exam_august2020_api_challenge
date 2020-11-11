require "rails_helper"

RSpec.describe "POST /api/comments", type: :request do
  let!(:user) { create(:user) }
  let!(:credentials) { user.create_new_auth_token }
  let!(:headers) { { HTTP_ACCEPT: "application/json" }.merge!(credentials) }
  let!(:article) { create(:article) }

  describe "POST /api/comments" do
    before do
      post "/api/comments/",
           params: {
             comment: {
               article_id: article.id,
               body: "This is a good article"
             }
           },
           headers: headers
    end

    it "returns a 201 response" do
      expect(response).to have_http_status 201
    end

    it "returns a sucess message" do
      expect(response_json["message"]).to eq "succesfully saved"
    end
  end
end
