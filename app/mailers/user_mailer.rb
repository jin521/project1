class UserMailer < ApplicationMailer


  def welcome(user)
    @user = user #@user will be whatever user we pass in to the 'welcome' method
    mail( :to => @user.email, :subject => "Welcome to stories4whiskies!", :cc => "autumn.qiujin@gmail.com" )
  end

  def send_whisky(from, to)
    @from = from
    @to = to
    mail( :to => @to.email, :subject => "#{@from.name} has sent you a whisky from stories4whiskies!!", :bcc => "autumn.qiujin@gmail.com", :cc => @from.email)
  end
end
