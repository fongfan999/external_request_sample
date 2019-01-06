require 'sinatra/base'

class FakeGitHub < Sinatra::Base
  get '/repos/:org/:project/contributors' do
    filename = [params.values_at('org', 'project'), 'contributors'].join('_')
    json_response 200, "#{filename}.json"
  end

  private

  def json_response(response_code, filename)
    content_type :json
    status response_code
    File.open("#{__dir__}/fixtures/github/#{filename}", 'rb').read
  rescue Errno::ENOENT
    content_type :json
    status 404
    File.open("#{__dir__}/fixtures/github/404_response.json" , 'rb').read
  end
end
