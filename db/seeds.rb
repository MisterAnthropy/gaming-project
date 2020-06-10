#create seed data to work with and test associations here

#create 2 users and games for both

gameboy = User.create(username: "gameboy", password: "boy")
gamegirl = User.create(username: "gamegirl", password: "girl")

VideoGame.create(title: "Minecraft", user_id: gameboy.id)

VideoGame.create(title: "Call of Duty", user_id: gamegirl.id)



