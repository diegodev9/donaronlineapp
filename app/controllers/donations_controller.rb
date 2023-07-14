class DonationsController < ApplicationController
  before_action :authenticate_api_v1_user!, only: %i[index show update destroy]
  before_action :set_donation, only: [:show, :update, :destroy]

  include CardValidator
  before_action :check_credit_card, only: %i[create update]

  # GET /donations
  def index
    @donations = Donation.all

    render json: @donations
  end

  # GET /donations/1
  def show
    render json: @donation
  end

  # POST /donations
  def create
    if @card_valid
      donor_ip = request.ip
      donor_browser = {
        "browser": browser.name,
        "platform": browser.platform,
        "device": browser.device
      }

      @donor = Donor.new(name: params[:donor][:donor_name], lastname: params[:donor][:donor_lastname],
                         email: params[:donor][:donor_email], ip: donor_ip, browser: donor_browser)

      if @donor.save
        @donation = Donation.new(donation_params)
        @donation.card_number = donation_params[:card_number]
        @donation.card_brand = @card_brand
        @donation.donor_id = @donor.id

        if @donation.save
          DonationMailer.with(user: @donor).thanks_email.deliver_later
          render json: { message: 'Donation created' }, status: :created, location: @donation
        else
          render json: @donation.errors, status: :unprocessable_entity
        end
      end
    else
      render json: { message: 'card is not valid' }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /donations/1
  def update
    if @card_valid
      if @donation.update(donation_params)
        render json: @donation
      else
        render json: @donation.errors, status: :unprocessable_entity
      end
    else
      render json: { message: 'card is not valid' }, status: :unprocessable_entity
    end
  end

  # DELETE /donations/1
  def destroy
    @donation.destroy
  end

  def list_donations

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_donation
    @donation = Donation.find(params[:id])
  end

  def check_credit_card
    validate_credit_card(donation_params[:card_number], params[:card][:expire_date])
  end

  # Only allow a list of trusted parameters through.
  def donation_params
    params.require(:donation).permit(:payment_type, :amount, :company_id, :donor_id, :card_brand, :card_number)
  end
end
