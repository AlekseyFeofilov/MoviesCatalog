//
//  RequestURLs.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 08.11.2022.
//

import Foundation

//ivan api
let baseURL = "http://51.195.49.72:8080/api"

//demo api
let demoBaseURL = "https://react-midterm.kreosoft.space/api"

let registerRequestURL = "/account/register"
let logoutRequestURL = "/account/logout"
let loginRequestURL = "/account/login"
let getFavoritesRequestURL = "/favorites"
let addFavoritesRequestURL = "/favorites/%@/add"
let deleteFavoritesRequestURL = "/favorites/%@/delete"
let getMoviesRequestURL = "/movies/%d"
let getMovieDetailRequestURL = "/movies/details/%d"
let addReviewRequestURL = "/movie/%@/review/add"
let editReviewRequestURL = "/movie/%@/review/%@/edit"
let deleteReviewRequestURL = "/movie/%@/review/%@/delete"
let getProfileInfoRequestURL = "/account/profile"
let editProfileInfoRequestURL = "/account/profile"



