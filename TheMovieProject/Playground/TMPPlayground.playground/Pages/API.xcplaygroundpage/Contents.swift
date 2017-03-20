import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

enum URLMethod: String {
    
    case searchMovie = "https://api.themoviedb.org/3/search/movie"
    case movieDetail = "https://api.themoviedb.org/3/movie"
    case genreListMovie = "https://api.themoviedb.org/3/genre/movie/list"
}

class TMDbAPI {
    
    class func getGenreMovieList() {
        
        let myParameters = [
            "api_key":"280e4dd3ac750ddf0bb4ec7d576c215a",
            "language":"en-US",
            ]
        
        NetworkHelper.shared.request
    
    }
}
