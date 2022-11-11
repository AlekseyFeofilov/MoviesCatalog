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
    var asyncToggle = true
    
    var currentGaleryMovie: Binding<Int> { Binding {
        return self._currentGaleryMovie
    } set: { value in
        self._currentGaleryMovie = value
        self.addMovies()
    }}
    
    var currentPage = 0
    var currentMovieCount = 0
    var pageCount = 1
    
    @Binding var isAuthorized: Bool
    @Binding var currentMovieId: String?
    
    init(isAuthorized: Binding<Bool>, currentMovieId: Binding<String?>){
        self._isAuthorized = isAuthorized
        self._currentMovieId = currentMovieId
        
        addMovies()
        getFavoriteMovies()
    }
    
    func removeFromFavorite(movie: MovieElementModel){
        
    }
    
    private func getFavoriteMovies(){
        MovieCatalog.getFavoriteMovies(authorizationFlag: self.$isAuthorized) { result in
            self.favoriteMovies = result
        }
    
    }
    
    private func addMovies() {
        guard asyncToggle else { return }
        guard currentPage != pageCount else { return }
        guard _currentGaleryMovie == currentMovieCount else { return }
        guard let token = getToken() else { return }
        
        asyncToggle = false
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
                    self.movies! += result.movies ?? []
                }
                
                self.asyncToggle = true
            })
        }
    }
}
