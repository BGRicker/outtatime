require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do
    before do
			@user = User.create!(first_name: "Guy", last_name: "Fieri", email: "guy@fieri.com", password: "asdasd", password_confirmation: "asdasd")
      @post = Post.create(date: Date.today, rationale: "A cool thing", user_id: @user.id)
    end

    it "can be created" do
      expect(@post).to be_valid
    end

    it "can not be created without date & rationale" do
      @post.date = nil
      @post.rationale = nil
      expect(@post).to_not be_valid
    end
  end
end
