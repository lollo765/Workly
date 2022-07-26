require "spec_helper"
require "factories/user.rb"

RSpec.describe User, type: :model do

    describe "Users." do
        context "can query." do
            it "retrived some users" do
                @users = User.where(skill: 'Shopify-Developer; ')
                expect(@users.length).to be >= 1
            end
            
        end
        context "can create new user." do
            it "creation" do
                @user = User.new
                @user.skill = 'Shopify-Developer; '
                @user.category = 'Sviluppo di siti web'
                @user.name = 'matteo'
                @user.email = 'matteo-singola@gmail.com'
                @user.encrypted_password = '$2a$12$oPQYo5eQWyDlYGoH9DaMNOJa6mIhT0yRlpElYB5ciZkhQ.GNZlfuW'
                @user.address = '0x123'
                @user.save()
                @users = User.where(email: 'matteo-singola@gmail.com')
                expect(@users.length).to be >= 1
            end
        end
    end
    
end