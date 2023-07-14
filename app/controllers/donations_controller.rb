class DonationsController < ApplicationController
  before_action :authenticate_api_v1_user!, only: %i[index show update destroy list_donations]
  before_action :set_donation, only: [:show, :update, :destroy]

  include CardValidator
  include CreateDonor
  before_action :check_credit_card, only: %i[create]

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
      create_donor
      if @donor.save
        @donation = Donation.new(donation_params)
        @donation.card_number = donation_params[:card_number]
        @donation.card_brand = @card_brand
        @donation.donor_id = @donor.id

        if @donation.save
          DonationMailer.with(user: @donor).thanks_email.deliver_later
          render json: { message: 'Donation created' }, status: :created, location: @donation
        else
          puts @donations.errors.full_messages
          render json: @donation.errors, status: :unprocessable_entity
        end
      else
        puts @donor.errors.full_messages
        render json: @donor.errors, status: :unprocessable_entity
      end
    else
      render json: { message: 'card is not valid' }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /donations/1
  def update
    if @donation.update(donation_params)
      render json: @donation
    else
      render json: @donation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /donations/1
  def destroy
    @donation.destroy
  end

  def list_donations
    if params[:from].present? && params[:to].present?
      params_from = params[:from].to_datetime.beginning_of_day.utc
      params_to = params[:to].to_datetime.end_of_day.utc
      @donations = Donation.where(created_at: [params_from..params_to])
    else
      @donations = Donation.all
    end

    render json: { "donations count": @donations.count , donations: @donations } , status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_donation
    @donation = Donation.find(params[:id])
  end

  def check_credit_card
    if params[:card][:expire_date].present?
      validate_credit_card(donation_params[:card_number], params[:card][:expire_date])
    else
      render json: { 'message': "expire date can't be empty" }
    end
  end

  # Only allow a list of trusted parameters through.
  def donation_params
    params.require(:donation).permit(:payment_type, :amount, :company_id, :donor_id, :card_brand, :card_number)
  end
end
