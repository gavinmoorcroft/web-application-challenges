require "spec_helper"
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

    context "GET /name" do
        it 'returns 200 OK' do
            response = get('/name')
            expected_response = "Hi, the names you are looking for are: Julia, Mary, Karim"

            expect(response.status).to eq(200)
            expect(response.body).to eq(expected_response)
        end
    end

    context "POST /sort_names" do
        it 'returns a sorted list of names' do
            response = post('sort_names',names:'Joe,Alice,Zoe,Julia,Kieran')
            expected_response = 'Alice,Joe,Julia,Kieran,Zoe'
  
            expect(response.status).to eq(200)
            expect(response.body).to eq(expected_response)
        end
    end

    context "404" do
        it 'returns 404 Not Found' do
            response = get('/anything_else')
            expected_response = "Hi there, sorry but we do not recognise that request. Please check and try again"

            expect(response.status).to eq(404)
            expect(response.body).to eq(expected_response)
        end
    end
end