require "iscraper/version"

module Iscraper
  def self.get_warranty_status imei
    # Perform http request
    begin
      uri          = URI.parse('https://selfsolve.apple.com/wcResults.do')
      http         = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request      = Net::HTTP::Post.new(uri.request_uri)

      request.set_form_data({
        'sn'       => imei,
        'Continue' => 'continue',
        'num'      => '0'
      })

      response      = http.request(request)
      response_data = response.body
    rescue
      return {error: "HTTP error while fetching warranty status for device #{imei}"}
    end

    # Perform scraping
    begin
      warranty_status = response_data.split('warrantyPage.warrantycheck.displayHWSupportInfo')[1].split('Repairs and Service Coverage: ')[1] =~ /^Active/ ? true : false
      expiration_date = Date.parse response_data.split('Estimated Expiration Date: ')[1].split('<')[0] if warranty_status

      return {
        warranty_status: warranty_status,
        expiration_date: expiration_date
      }
    rescue
      {error: "Error occured while fetching warranty status for device #{imei}: Incorrect IMEI or unexpected reply from the Apple server"}
    end
  end
end
