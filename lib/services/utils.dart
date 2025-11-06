// const apiKey = "d607fce54f09b71aa6ae876f60c59516";
// const baseUrl =
//     "https://api.themoviedb.org/3/"; //this is url is same for all api only the endpoint is changed
class Urls{
  static const baseUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=d26a8dd97ecb04414d11287cd30cca91';
  static const nowPlaying = 
      'https://api.themoviedb.org/3/movie/now_playing?api_key=d26a8dd97ecb04414d11287cd30cca91';
  static const toprated =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=d26a8dd97ecb04414d11287cd30cca91';
  static const upcomings =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=d26a8dd97ecb04414d11287cd30cca91';
  static const tvshows =
      'https://api.themoviedb.org/3/tv/airing_today?api_key=d26a8dd97ecb04414d11287cd30cca91';
  static const search =
      'https://api.themoviedb.org/3/search/multi?api_key=d26a8dd97ecb04414d11287cd30cca91&query=';
}