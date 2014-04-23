require 'net/http'

module NodeJs
  module Checksum

    def get_checksum(shasumsurl, filename)
      get_checksum_file(shasumsurl).each_line do |l|
        shasum = l.split(/\s+/).first if l.match(filename)
      end
      raise "Could not find #{filename} in #{shasumsurl}" unless defined? shasum
      shasum
    end

    private

    def get_checksum_file(shasumsurl)
      res = Net::HTTP.get_response(URI(shasumsurl))
      raise "Could not download #{shasumsurl}" unless res.code == "200"
      res.body
    end

  end
end
