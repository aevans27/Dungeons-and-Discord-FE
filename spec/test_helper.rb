def load_test_data
  @user1 = User.create!(uid: "123", username: "bubba", token: 'password123')
  @current_user = @user1
end