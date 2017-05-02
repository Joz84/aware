# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

GameSkill.destroy_all
Game.destroy_all
ChallengeSkill.destroy_all
Constraint.destroy_all
Challenge.destroy_all
Skill.destroy_all
Mission.destroy_all
Category.destroy_all
User.destroy_all

categories = ["Faire", "Imaginer", "M'inspirer"]

categories.each { |category| Category.new(title: category) }

admin = User.create(  email: "admin@a-waree.io",
                      password: "azerty",
                      first_name: "admin",
                      last_name: "a-waree",
                      facebook_picture_url: 'http://www.cerbobillot.fr/images/pages/autocollant-a-jeune-conducteur.jpg',
                      admin: true
                )


# u1 = User.create( email: "mathieu33@gmail.com",
#                   password: "azerty",
#                   first_name: "Mathieu33",
#                   photo_url: 'http://infused.sens-media.com/wp-content/uploads/2017/01/c68dydo8nqe-jake-young-e1484753790702.jpg'
#                 )

# u2 = User.create( email: "norman@gmail.com",
#                   password: "azerty",
#                   first_name: "Norman",
#                   photo_url: "https://pbs.twimg.com/profile_images/828193179421794304/5ccbnMNS.jpg"
#                 )
# u3 = User.create( email: "papy@gmail.com",
#                   password: "azerty",
#                   first_name: "Papy",
#                   photo_url: "https://treizhebdo.files.wordpress.com/2016/02/papy-web.png"
#                 )

# s1 = Skill.create(title: "Créativité")
# s2 = Skill.create(title: "Logique")
# s3 = Skill.create(title: "Agilité")

# m1 = Mission.create(title: "Créer un VLOG")
# # m2 = Mission.create(title: "")

# c1 = Challenge.create( mission: m1,
#                   title: "CREER LE STORYTELLING",
#                   description: "",
#                   category: categories[1]
#                 )

# c2 = Challenge.create( mission: m1,
#                   title: "CREER LA SCENOGRAPHIE",
#                   description: "",
#                   category: categories[1]
#                 )

# c3 = Challenge.create( mission: m1,
#                   title: "CREER UN UNIVERS GRAPHIQUE",
#                   description: "",
#                   category: categories[1]
#                 )

# cs1 = ChallengeSkill.create( challenge: c1,
#                        skill: s1
#                       )

# cs2 = ChallengeSkill.create( challenge: c1,
#                        skill: s2
#                       )

# cs3 = ChallengeSkill.create( challenge: c1,
#                        skill: s3
#                       )

# cs3 = ChallengeSkill.create( challenge: c3,
#                        skill: s1
#                       )

# co1 = Constraint.create( title: "Licorne",
#                          challenge: c1
#                         )

# co2 = Constraint.create( title: "Robot",
#                          challenge: c1
#                         )

# co3 = Constraint.create( title: "Ta maman qui t'envoie un sms",
#                          challenge: c1
#                         )

# g1 = Game.create( user: u2,
#                   challenge: c1,
#                   constraint: co2
#                 )

# GameSkill.create( mentor: u3,
#                   game: g1,
#                   skill: s1,
#                   rating: 10
#                   )

# GameSkill.create( mentor: u3,
#                   game: g1,
#                   skill: s2,
#                   rating: 8
#                   )
# GameSkill.create( mentor: u3,
#                   game: g1,
#                   skill: s3,
#                   rating: 9
#                   )
