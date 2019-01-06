module ExternalRequestSample
  class Github
    def fetch_contributors(organization:, project:)
      uri = generate_uri(organization: organization, project: organization)
      response = JSON.load(Net::HTTP.get(uri))
      return [] unless response.kind_of?(Array) # Should check status code at here

      response.map { |contributor| contributor['login'] }
    end

    private

    def generate_uri(organization:, project:)
      URI("https://api.github.com/repos/#{organization}/#{project}/contributors")
    end
  end
end
