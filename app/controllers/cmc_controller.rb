require "uri"
require "net/http"

class CmcController < ApplicationController
    protect_from_forgery with: :exception
    def index
        uri = URI('https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest')
        req = Net::HTTP::Get.new(uri)
        req['X-CMC_PRO_API_KEY'] = '346b5e37-be8c-4f6f-8d54-2d0bb4d5b498'
        res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') { |http|
            http.request(req)
        }
        render json: res.body
    end
    respond_to :json
end
