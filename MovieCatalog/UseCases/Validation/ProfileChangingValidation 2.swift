//
//  ProfileChangingValidation.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 08.11.2022.
//

import Foundation

func profileInfoValidate(name: String, email: String, birthday: Date?, gender: Gender?) -> ProfileChangingError{
    guard emptyValidation(name: name, email: email, birthday: birthday, gender: gender) else { return .emptyParameter }
    guard birthdayValidation(birthday: birthday!) else { return .tooYoung }
    guard emailValidate(email: email) else { return .incorrectEmail }
    
    return .none
}

func emptyValidation(name: String, email: String, birthday: Date?, gender: Gender?) -> Bool{
    return !(name.isEmpty || email.isEmpty || birthday == nil || gender == nil)
}
