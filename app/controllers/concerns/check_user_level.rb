# frozen_string_literal: true
module CheckUserLevel
  extend ActiveSupport::Concern

  def check_if_user_is_admin
    current_user.admin?
  end
end
