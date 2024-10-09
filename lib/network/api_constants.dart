class ApiConstants {
  static const String BASE_URL = "https://api.unsplash.com/";
  static const String GET_PHOTOS = "photos?per_page=30&page=1";
  static const String LIKE_UNLIKE_PHOTO = "photos/%s/like";
}

enum Method { GET, POST, DELETE }

enum ApiName { GET_PHOTOS, LIKE_PHOTO, UNLIKE_PHOTO }
