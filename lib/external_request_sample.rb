Dir[File.join(File.dirname(__FILE__), 'external_request_sample', '*.rb')].each { |f| require_relative f }

module ExternalRequestSample; end
