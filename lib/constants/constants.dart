enum FormMode {
  CREATE,
  EDIT,
}

enum MovieSource {
  LOCAL,
  REMOTE
}

enum APIOperation {
  None,
  GET,
  POST,
}

enum DBOperation {
  None,
  Read,
  Create,
  Update,
  Delete,
}

class PosterUrl {
  
  static String w92(String posterPath) => 'http://image.tmdb.org/t/p/w92$posterPath';
  static String w185(String posterPath) => 'http://image.tmdb.org/t/p/w185$posterPath';
  static String w500(String posterPath) => 'http://image.tmdb.org/t/p/w500$posterPath';

}
