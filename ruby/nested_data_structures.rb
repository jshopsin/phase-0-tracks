nine_lives_shelter = {
  adopted_cats: {
    brought_home: ["Stormy", "Spot", "Princess"],
    wait_for_pickup: ["Winter", "Chandler", "Africa", "Caty"],
    wait_for_spay_nueter: ["Cloudy", "Skye", "Marvin", "Athena"]
  },
  available_cats: [
    male_adults = {
      garfield: {name: "Garfield", cage: 2, age: 4, status: "nuetered"},
      grover: {name: "Grover", cage: 3, age: 6, status: "not nuetered"},
      bruno: {name: "Bruno", cage: 1, age: 2, status: "not nuetered"}
    },
    female_adults = {
      lyla: {name: "Lyla", cage: 5, age: 2, status: "not spayed"},
      amber: {name: "Amber", cage: 4, age: 8, status: "spayed"},
      heather: {name: "Heather", cage: 6, age: 10, status: "spayed"}
    },
    male_kittens = {
      zed: {name: "Zed", cage: 10, age: "4 mos", status: "not nuetered"},
      scratchy: {name: "Scrathcy", cage: 10, age: "3 mos", status: "not nuetered"},
      ulysses: {name: "Ulysses", cage: 11, age: "2 mos", status: "not nuetered"},
    },
    female_kittens = {
      tazmina: {name: "Tazmina", cage: 11, age: "2 mos", status: "not spayed"},
      tigre: {name: "Tigre", cage: 12, age: "3 mos", status: "not spayed"},
      scabbers: {name: "Scabbers", cage: 12, age: "3 mos", status: "not spayed"}
    }
  ]
}

p nine_lives_shelter[:available_cats][0][:grover]
p nine_lives_shelter[:adopted_cats][:wait_for_spay_nueter].push("Ginger")

nine_lives_shelter[:available_cats][-1].delete(:tigre)
p nine_lives_shelter[:available_cats][-1]
p nine_lives_shelter[:adopted_cats][:wait_for_spay_nueter].push("Tigre")