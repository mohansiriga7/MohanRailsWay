module FormHelper
  def setup_user(account)
    account.picture ||= Picture.new
    account
  end
end

