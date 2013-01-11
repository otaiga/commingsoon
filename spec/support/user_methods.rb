def create_confirm_user
  @user = User.create(email: "test_user@example.com", password: "password")
  @user.confirm!
end

def given_user
  @user
end