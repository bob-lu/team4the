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
											{ name: "Springa 1 mil (Isotop-event)", is_single_point: false },
											{ name: "Simma 400 meter", is_single_point: false },
											{ name: "Cykla 5 mil", point: 6 },
											{ name: "Simma 400 meter", is_single_point: false },
											{ name: "Cindy", is_single_point: false, point: 5 },
											{ name: "Alternativ Cindy", is_single_point: false, point: 3 },
											{ name: "Pas de Bourrée (Isotop-event)", is_single_point: false, point: 1 },
											{ name: "Hälkick & högt knä (Isotop-event)", is_single_point: false, point: 1 },
											{ name: "Jonglering med 3 bollar", is_single_point: false },
											{ name: "Skjuta hare - höger & vänster", is_single_point: false },
											{ name: "Muscle up", point: 6 },
											{ name: "Prova på en sport", is_single_point: false, point: 1 },
											{ name: "Hoppa hopprep, double unders", is_single_point: false },
											{ name: "Koppla händer", is_single_point: false },
											{ name: "Axelrotation", point: 1 },
											{ name: "Sittande press med rundstav", point: 4 },
											{ name: "Chins/Ringar", is_single_point: false },
											{ name: "Stå på händer 5 sekunder", point: 2 },
											{ name: "Dans (Isotop-event)", is_single_point: false, point: 1 },
											{ name: "Hoppa från 10an", point: 2 },
											{ name: "Dyka från 5an", point: 2 }
									])