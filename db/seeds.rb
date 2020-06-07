#create seed data to work with and test associations here

#create 2 users and games for both

gameboy = Users.create(username: "gameboy", password: "boy")
gamegirl = Users.create(username: "gamegirl", password: "girl")

VideoGames.create(title: "Minecraft", user_id: gameboy.id)

VideoGames.create(title: "Call of Duty", user_id: gamegirl.id)



