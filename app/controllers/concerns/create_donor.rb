module CreateDonor
  extend ActiveSupport::Concern

  def create_donor
    donor_ip = request.ip
    donor_browser = {
      "browser": browser.name,
      "platform": browser.platform,
      "device": browser.device
    }

    @donor = Donor.new(name: params[:donor][:name], lastname: params[:donor][:lastname],
                       email: params[:donor][:email], ip: donor_ip, browser: donor_browser)
  end
end
