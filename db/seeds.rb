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
User.destroy_all
Skill.destroy_all
Category.destroy_all

categories = ["Mathématiques", "Histoire de l'art", "Informatique"]

categories.each { |category| Category.create(title: category) }

s1 = Skill.create(title: "Créativité")
s2 = Skill.create(title: "Logique")
s3 = Skill.create(title: "Agilité")

admin = User.create(  email: "admin@a-waree.io",
                      password: "azerty",
                      first_name: "admin",
                      last_name: "a-waree",
                      facebook_picture_url: 'http://www.cerbobillot.fr/images/pages/autocollant-a-jeune-conducteur.jpg',
                      admin: true,
                      specialty: s1
                    )


u1 = User.create( email: "mathieu33@gmail.com",
                  password: "azerty",
                  first_name: "Mathieu33",
                  facebook_picture_url: 'http://infused.sens-media.com/wp-content/uploads/2017/01/c68dydo8nqe-jake-young-e1484753790702.jpg'
                )

u2 = User.create( email: "norman@gmail.com",
                  password: "azerty",
                  first_name: "Norman",
                  facebook_picture_url: "https://pbs.twimg.com/profile_images/828193179421794304/5ccbnMNS.jpg"
                )
u3 = User.create( email: "papy@gmail.com",
                  password: "azerty",
                  first_name: "Papy",
                  facebook_picture_url: "https://treizhebdo.files.wordpress.com/2016/02/papy-web.png"
                )


c1 = Challenge.create(
                  title: "CREER LE STORYTELLING",
                  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus accusamus sit consequuntur optio atque eos ea accusantium fugiat, nemo doloremque praesentium repellendus soluta pariatur laudantium qui illo inventore, beatae ut.",
                  category: Category.first
                )

c2 = Challenge.create(
                  title: "CREER LA SCENOGRAPHIE",
                  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Numquam soluta, quos unde veritatis impedit fugiat obcaecati deserunt minima dolorum, voluptate, neque mollitia optio consequatur. Provident enim nulla reprehenderit delectus harum.",
                  category: Category.first
                )

c3 = Challenge.create(
                  title: "CREER UN UNIVERS GRAPHIQUE",
                  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Placeat rem sint, suscipit ducimus accusamus mollitia sapiente deserunt hic iste odio tempore accusantium totam! Nobis tempora ullam sed modi, nihil accusamus?",
                  category: Category.first
                )

cs1 = ChallengeSkill.create( challenge: c1,
                       skill: s1
                      )

cs2 = ChallengeSkill.create( challenge: c1,
                       skill: s2
                      )

cs3 = ChallengeSkill.create( challenge: c1,
                       skill: s3
                      )

cs3 = ChallengeSkill.create( challenge: c3,
                       skill: s1
                      )

co1 = Constraint.create( title: "Licorne",
                         challenge: c1
                        )

co2 = Constraint.create( title: "Robot",
                         challenge: c1
                        )

co3 = Constraint.create( title: "Ta maman qui t'envoie un sms",
                         challenge: c1
                        )

g1 = Game.create( user: u2,
                  challenge: c1,
                  constraint: co2
                )


g2 = Game.create( user: u1,
                  challenge: c1,
                  constraint: co3
                )

g3 = Game.create( user: u1,
                  challenge: c2,
                  constraint: co2
                )


g4 = Game.create( user: u1,
                  challenge: c3,
                  constraint: co3
                )

GameSkill.create( mentor: u3,
                  game: g1,
                  skill: s1,
                  rating: 10
                  )

GameSkill.create( mentor: u3,
                  game: g1,
                  skill: s2
                  )
GameSkill.create( mentor: u3,
                  game: g1,
                  skill: s3,
                  rating: 9
                  )

GameSkill.create( mentor: u2,
                  game: g2,
                  skill: s1,
                  rating: 10
                  )

GameSkill.create( mentor: u3,
                  game: g2,
                  skill: s2,
                  rating: 8
                  )



GameSkill.create( mentor: u3,
                  game: g3,
                  skill: s1,
                  rating: 10
                  )

GameSkill.create( mentor: u3,
                  game: g3,
                  skill: s2,
                  rating: 8
                  )
GameSkill.create( mentor: u3,
                  game: g3,
                  skill: s3,
                  rating: 9
                  )

GameSkill.create( mentor: u2,
                  game: g4,
                  skill: s1
                  )

GameSkill.create( mentor: u3,
                  game: g4,
                  skill: s2,
                  rating: 9
                  )
