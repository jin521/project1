class UserMailer < ApplicationMailer


  def welcome(user)
  @user = user #@user will be whatever user we pass in to the 'welcome' method
  mail( :to => @user.email, :subject => "Welcome to stories4whiskies!", :cc => "autumn.qiujin@gmail.com" )
end


end
