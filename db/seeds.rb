#!/bin/env ruby
# encoding: utf-8

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

Achievement.create([
											{ name: "Springa 1 mil (Isotop-event)", is_single_point: false, uid: "springa" },
											{ name: "Simma 400 meter", is_single_point: false, uid: "simma" },
											{ name: "Cykla 5 mil", point: 6, uid: "cykla" },
											{ name: "Cindy", is_single_point: false, point: 5, uid: "cindy" },
											{ name: "Alternativ Cindy", is_single_point: false, point: 3, uid: "a_cindy" },
											{ name: "Pas de Bourrée (Isotop-event)", is_single_point: false, point: 1, uid: "pasde" },
											{ name: "Hälkick & högt knä (Isotop-event)", is_single_point: false, point: 1, uid: "heal" },
											{ name: "Jonglering med 3 bollar", is_single_point: false, uid: "jonglering" },
											{ name: "Skjuta hare - höger & vänster", is_single_point: false, uid: "hare" },
											{ name: "Muscle up", point: 6, uid: "muscle" },
											{ name: "Prova på en sport", is_single_point: false, point: 1, uid: "tryout" },
											{ name: "Hoppa hopprep, double unders", is_single_point: false, uid: "hopprep" },
											{ name: "Koppla händer", is_single_point: false, uid: "koppla" },
											{ name: "Axelrotation", point: 1, uid: "axelrot" },
											{ name: "Sittande press med rundstav", point: 4, uid: "sittpress" },
											{ name: "Chins", is_single_point: false, uid: "chins" },
											{ name: "Ringar", is_single_point: false, uid: "rings" },
											{ name: "Stå på händer 5 sekunder", point: 2, uid: "handstand" },
											{ name: "Dans (Isotop-event)", is_single_point: false, point: 1, uid: "dans" },
											{ name: "Hoppa från 10an", point: 2, uid: "hoppa10" },
											{ name: "Dyka från 5an", point: 2, uid: "dyka5" },
											{ name: "Plankan (Isotop-event)", is_single_point: false, uid: "plankan" },
											{ name: "Luftstol (Isotop-event)", is_single_point: false, uid: "luftstol" }
									])