module CardValidator
  extend ActiveSupport::Concern

  def validate_credit_card_number(card_number)
    detector = CreditCardValidations::Detector.new(card_number)
    @card_valid = detector.valid?
    @card_brand = detector.brand
  end

  def validate_credit_card(card_number, expire_date)
    card_expired = Time.zone.today.beginning_of_month > expire_date.to_date

    if card_expired
      render json: { 'message': 'credit card is expired' }, status: :unprocessable_entity
    else
      validate_credit_card_number(card_number)
    end
  end
end
