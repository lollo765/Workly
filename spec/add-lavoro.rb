require "spec_helper"
require "factories/lavoro.rb"

RSpec.describe Lavoro, type: :model do


    describe "Lavori." do
        context "can query." do
            it "retrived some works" do
                @lavoros = Lavoro.where()
                expect(@lavoros.length).to be >= 1
            end
        end
        context "can create a work." do
            it "creation" do
                @lavoro = Lavoro.new
                @lavoro.title = 'Lavoro nuova test'
                @lavoro.description = 'La mia descrizione'
                @lavoro.n_Lavoratori = 5
                @lavoro.categories = 'Sviluppo di siti web'
                @lavoro.timer = 5
                @lavoro.skill_Lavoratori = 'Shopify-Developer; '
                @lavoro.currency = 'BTC'
                @lavoro.cost = '0.001'
                @lavoro.email = 'matteo-singola@gmail.com'
                @lavoro.save()

                @lavori = Lavoro.where(title: 'Lavoro nuova test')
                expect(@lavori.length).to be >= 1
            end
            it "fail validation" do
                @lavoro = Lavoro.new
                @lavoro.description = 'La mia descrizione'
                @lavoro.n_Lavoratori = 5
                @lavoro.categories = 'Sviluppo di siti web'
                @lavoro.timer = 5
                @lavoro.skill_Lavoratori = 'Shopify-Developer; '
                @lavoro.currency = 'BTC'
                @lavoro.cost = '0.001'
                @lavoro.email = 'matteo-singola@gmail.com'
                expect(@lavoro.valid?).to eq(false)
            end
        end
    end
    
end