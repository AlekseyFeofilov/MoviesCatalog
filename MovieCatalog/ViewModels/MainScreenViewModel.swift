//
//  MainScreenViewModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 09.11.2022.
//

import Foundation
import SwiftUI
import Alamofire

class MainScreenViewModel: ObservableObject{
    @Published var movies: [MovieElementModel]? = nil
    @Published var favoriteMovies: [MovieElementModel]? = nil
    @Published var promotedMovie: MovieElementModel? = nil
    @Published private var _currentGaleryMovie: Int = 0
    
    var currentGaleryMovie: Binding<Int> { Binding {
        return self._currentGaleryMovie
    } set: { value in
        self._currentGaleryMovie = value
        self.addMovies()
    }
}
    
    var currentPage = 0
    var currentMovieCount = 0
    var pageCount = 1
    
    @Binding var isAuthorized: Bool
    
    init(isAuthorized: Binding<Bool>){
        self._isAuthorized = isAuthorized
        
        addMovies()
        getFavoriteMovies()
    }
    
    func removeFromFavorite(movie: MovieElementModel){
        
    }
    
    private func getFavoriteMovies(){
        guard let token = getToken() else { return }
        var headers: HTTPHeaders = [:]
        headers["Authorization"] = "Bearer " + token
        
        AF.request(
            demoBaseURL + getFavoritesRequestURL,
            method: .get,
            encoding: JSONEncoding.default,
            headers: headers
        ).responseData { response in
            handleResponse(response, authorizationFlag: self.$isAuthorized, resultHandle: { data in
                let result = try? JSONDecoder().decode(MovieListModel.self, from: data)
                guard let result = result?.movies else { return }
                self.favoriteMovies = result
            })
        }
    }
    
    private func addMovies(){
        guard currentPage != pageCount else { return }
        guard _currentGaleryMovie == currentMovieCount else { return }
        guard let token = getToken() else { return }
        print("Next page taken")
        var headers: HTTPHeaders = [:]
        headers["Authorization"] = "Bearer " + token

        AF.request(
            String(format: demoBaseURL + getMoviesRequestURL, arguments: [currentPage + 1]),
            method: .get,
            encoding: JSONEncoding.default,
            headers: headers
        ).responseData { response in
            handleResponse(response, authorizationFlag: self.$isAuthorized, resultHandle: { data in
                let result = try? JSONDecoder().decode(MoviesPagedListModel.self, from: data)
                guard let result = result else { return }
                self.pageCount = result.pageInfo.pageCount
                self.currentPage = result.pageInfo.currentPage
                self.currentMovieCount += result.pageInfo.pageSize
                
                if self.currentPage == 1 {
                    self.movies = result.movies?.suffix(result.movies!.count - 1) ?? []
                    self.promotedMovie = result.movies?.first
                    self.currentMovieCount -= 1
                }
                else {
                    self.movies! += result.movies?.suffix(result.movies!.count - 1) ?? []
                }
            })
        }
    }
}
