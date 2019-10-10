import UIKit

struct UserDTO: Codable {
    let gender: String?
    let name: NameDTO?
}

struct NameDTO: Codable {
    let title: String?
    let first: String?
    let last: String?
}

let jsonUserString = """
[
   {
      "gender":"male",
      "name":{
         "title":"Mr",
         "first":"Sansão",
         "last":"Ferreira"
      }
   },
   {
      "gender":"female",
      "name":{
         "title":"Ms",
         "first":"Sonia",
         "last":"Lasocho"
      }
   }
]
"""

// Paso un string a diccionario
if let dataUser = jsonUserString.data(using: .utf8),
    let user = try? JSONSerialization.jsonObject(with: dataUser, options: []) as? [String : Any] {
        print(user)
    
    
    // Paso el string a structs
//    let encoder = JSONEncoder()
    let decoder = JSONDecoder()

    if let userDTO = try? decoder.decode(UserDTO.self, from: dataUser) {
       print(userDTO)
        
        let nameUserCodigo = NameDTO(title: "Mr", first: "Sansao", last: "Ferreira")
        let userCodigo = UserDTO(gender: "male", name: nameUserCodigo)
        
        print(userCodigo)
    }

}

