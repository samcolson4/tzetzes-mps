def signed_in?
  unless current_user.blank?
    signed_in = True
    @user = current_user
  else
    signed_in = False
  end
end