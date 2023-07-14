module CardValidator
  extend ActiveSupport::Concern

  def validate_credit_card_number(card_number)
    detector = CreditCardValidations::Detector.new(card_number)
    @card_valid = detector.valid?
    @card_brand = detector.brand
  end

  def validate_credit_card(card_number, expire_date)
    this_month = Time.zone.today.month
    card_expired = expire_date.to_date.month > this_month

    if card_expired
      errors.add(message: 'card is expired')
    else
      validate_credit_card_number(card_number)
    end
  end
end
