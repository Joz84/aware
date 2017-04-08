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
Challenge.destroy_all
Skill.destroy_all
Mission.destroy_all
User.destroy_all

u1 = User.create( email: "a@gmail.com",
              password: "azerty",
            )

u2 = User.create( email: "b@gmail.com",
              password: "azerty",
            )


s1 = Skill.create(title: "raper les carottes")
s2 = Skill.create(title: "enlever les crottes de nez")
s3 = Skill.create(title: "sortir les poubelles en porte jartelle")

m1 = Mission.create(title: "Gérer la cuisine")
m2 = Mission.create(title: "Avoir un nez propre")

c1 = Challenge.create( mission: m1,
                  title: "avec des ciseaux",
                  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                                Repellendus mollitia impedit sed dolorem nihil dolore,
                                veritatis ex eveniet fugiat cumque magni, consequatur
                                repudiandae neque, soluta inventore saepe minus corporis. Beatae.",
                  technician: true
                )

c2 = Challenge.create( mission: m1,
                  title: "en petite tenue",
                  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                                Repellendus mollitia impedit sed dolorem nihil dolore,
                                veritatis ex eveniet fugiat cumque magni, consequatur
                                repudiandae neque, soluta inventore saepe minus corporis. Beatae.",
                  technician: true
                )

c3 = Challenge.create( mission: m2,
                  title: "comme le reste de la figure",
                  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                                Repellendus mollitia impedit sed dolorem nihil dolore,
                                veritatis ex eveniet fugiat cumque magni, consequatur
                                repudiandae neque, soluta inventore saepe minus corporis. Beatae.",
                  technician: false
                )

cs1 = ChallengeSkill.create( challenge: c1,
                       skill: s1
                      )

cs2 = ChallengeSkill.create( challenge: c2,
                       skill: s2
                      )

cs3 = ChallengeSkill.create( challenge: c2,
                       skill: s1
                      )

cs3 = ChallengeSkill.create( challenge: c3,
                       skill: s3
                      )

g1 = Game.create( user: u1,
             challenge: c1
            )

GameSkill.create( mentor: u2,
                  game: g1,
                  skill: s1,
                  rating: 10
                  )

GameSkill.create( mentor: u2,
                  game: g1,
                  skill: s2
                  )
