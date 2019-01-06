require 'spec_helper'
require_relative '../../lib/external_request_sample/github'

describe ExternalRequestSample::Github do
  context '#fetch_contributors' do
    it 'with valid organization and project' do
      contributors = subject.fetch_contributors(organization: 'rails', project: 'rails')
      expect(contributors).to include('dhh', 'tenderlove', 'rafaelfranca')
    end

    it 'with invalid organization or project' do
      contributors = subject.fetch_contributors(organization: 'invalid', project: 'invalid')
      expect(contributors).to be_empty
    end
  end
end
