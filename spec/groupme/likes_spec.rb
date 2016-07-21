require 'spec_helper'

describe GroupMe::Likes do

  before do
    @client = GroupMe::Client.new(:token => 'TEST')
  end

  let :data do
    {
      :status => 200,
      :body => {
        :response => nil,
        :meta => {
          :code => 200
        }
      }.to_json,
      :headers => {
        :content_type => 'application/json; charset=utf-8'
      }
    }
  end

  describe '.create_like' do

    it 'likes a message' do
      stub_post('/messages/3/5/like').to_return(data)
      response = @client.create_like(3, 5)
      expect(response).to eq(true)
    end

  end

  describe '.destroy_like' do

    it 'likes a message' do
      stub_post('/messages/234/8/unlike').to_return(data)
      response = @client.destroy_like(234, 8)
      expect(response).to eq(true)
    end

  end

end
