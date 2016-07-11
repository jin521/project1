

Like.destroy_all
l1 = Like.create(:id => "1")
l2 = Like.create(:id => "2")
l3 = Like.create(:id => "3")



Story.destroy_all
s1 = Story.create(:title => "All Along the way ")
s2 = Story.create(:title => "Raining night")
s3 = Story.create(:title => "special day ")




User.destroy_all
u1 = User.create(:email => "The_Blade_420@homebrew.com")
u2 = User.create(:email => "Badger@badger.com")
u3 = User.create(:email => "Wolf@wolf.com")


u1.stories << s1
u2.stories << s2
u3.stories << s3
