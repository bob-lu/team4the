
team1 = Team.create(name: "Team 1")
team2 = Team.create(name: "Team 2")
team3 = Team.create(name: "Team 3")
team4 = Team.create(name: "Team 4")
team5 = Team.create(name: "Team 5")
team6 = Team.create(name: "Team 6")

team1_users = User.create([
														{ username: "robdah", password: "changeme", password_confirmation: "changeme" },
														{ username: "nilflo", password: "changeme", password_confirmation: "changeme" },
														{ username: "alblar", password: "changeme", password_confirmation: "changeme" },
														{ username: "mikryd", password: "changeme", password_confirmation: "changeme" },
														{ username: "chrsve", password: "changeme", password_confirmation: "changeme" },
														{ username: "eriwad", password: "changeme", password_confirmation: "changeme" }
													])

team1.users = team1_users

team2_users = User.create([
														{ username: "jonand", password: "changeme", password_confirmation: "changeme" },
														{ username: "krinor", password: "changeme", password_confirmation: "changeme" },
														{ username: "jenell", password: "changeme", password_confirmation: "changeme" },
														{ username: "erimic", password: "changeme", password_confirmation: "changeme" },
														{ username: "karmor", password: "changeme", password_confirmation: "changeme" }
													])

team2.users = team2_users

team3_users = User.create([
														{ username: "stejan", password: "changeme", password_confirmation: "changeme" },
														{ username: "nilwik", password: "changeme", password_confirmation: "changeme" },
														{ username: "gabwid", password: "changeme", password_confirmation: "changeme" },
														{ username: "bjolen", password: "changeme", password_confirmation: "changeme" },
														{ username: "persta", password: "changeme", password_confirmation: "changeme" }
													])

team3.users = team3_users

team4_users = User.create([
														{ username: "kimlin", password: "changeme", password_confirmation: "changeme" },
														{ username: "erinil", password: "changeme", password_confirmation: "changeme" },
														{ username: "simzee", password: "changeme", password_confirmation: "changeme" },
														{ username: "anagan", password: "changeme", password_confirmation: "changeme" },
														{ username: "torwes", password: "changeme", password_confirmation: "changeme" }
													])

team4.users = team4_users

team5_users = User.create([
														{ username: "eriwen", password: "changeme", password_confirmation: "changeme" },
														{ username: "karber", password: "changeme", password_confirmation: "changeme" },
														{ username: "jonbru", password: "changeme", password_confirmation: "changeme" },
														{ username: "frejak", password: "changeme", password_confirmation: "changeme" },
														{ username: "johber", password: "changeme", password_confirmation: "changeme" }
													])

team5.users = team5_users

team6_users = User.create([
														{ username: "persch", password: "changeme", password_confirmation: "changeme" },
														{ username: "tobjak", password: "changeme", password_confirmation: "changeme" },
														{ username: "persah", password: "changeme", password_confirmation: "changeme" },
														{ username: "frefor", password: "changeme", password_confirmation: "changeme" }
													])

team6.users = team6_users