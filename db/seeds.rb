Organization.create ([
  { title: "ABC Company", location: "Sydney" },
  { title: "XYZ Company", location: "Brisbane" },
  { title: "Company ABC XYZ", location: "Melbourne"}
])

Person.create([
  { first_name: "Paul", last_name: "Smith", organization: Organization.first, assessement_count: 1},
  { first_name: "Andrew", last_name: "Baker", organization: Organization.find(2), assessement_count: 0},
  { first_name: "Michael", last_name: "Clarke", organization: Organization.last, assessement_count: 14},
  { first_name: "David", last_name: "Cline", organization: Organization.first, assessement_count: 3},
  { first_name: "Adam", last_name: "Broadbent", organization: Organization.find(2), assessement_count: 1}
])
