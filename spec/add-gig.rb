require "spec_helper"
require "factories/gig.rb"

RSpec.describe Gig, type: :model do

 

    describe "Gigs." do
        context "can query." do
            it "retrived some gigs" do
                @gigs = Gig.where()
                expect(@gigs.length).to be >= 1
            end
        end
        context "can create a gig." do
            it "creation" do
                @gig = Gig.new
                @gig.title = 'Gig nuova test'
                @gig.skill = 'Shopify-Developer; '
                @gig.categories = 'Sviluppo di siti web'
                @gig.currency = 'BTC'
                @gig.cost = '0.001'
                @gig.description = 'La mia descrizione'
                @gig.email = 'matteo-singola@gmail.com'
                @gig.save()
                @gigs = Gig.where(title: 'Gig nuova test')
                expect(@gigs.length).to be >= 1
            end
            it "fail validation" do
                @gig = Gig.new
                @gig.title = 'Gig nuova test'
                @gig.categories = 'Sviluppo di siti web'
                @gig.currency = 'BTC'
                @gig.cost = '0.001'
                @gig.description = 'La mia descrizione'
                @gig.email = 'matteo-singola@gmail.com'
                expect(@gig.valid?).to eq(false)
            end
        end
    end

 
    
end