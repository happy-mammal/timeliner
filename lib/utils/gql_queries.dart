class GqlQueries {
  String getStories() {
    return '''
      query{
        getStories{
          id
          category
          image
          title
        }
      }''';
  }

  String getArticlesFromSource(String source, String limit) {
    return '''
      query{
        getArticlesFromSource(source:"The Guardian"limit:3){
          id
          image
          category
          title
        }
      }
    ''';
  }

  String getArticlesFromCategory(String category, String limit) {
    return '''
      query{
        getArticlesFromCategory(category: "technology", limit: 3) {
          id
          image
          category
          title
        }
      }
    ''';
  }
}
