//
//  LoginValidation.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 06.11.2022.
//

import Foundation

func signInValidate(login: String, password: String) -> Bool{
    return !login.isEmpty && !password.isEmpty
}

//func signUpValidate(email: String, name: String, )
