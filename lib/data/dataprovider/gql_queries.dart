class GqlQueries {
  String getStories() {
    return '''
      query{
        getStories{
          id
          category
          image
          title
          description
          source
          publishedAt
        }
      }''';
  }

  String getArticlesFromSource(String source, String limit) {
    return '''
      query{
        getArticlesFromSource(source:"''' +
        source +
        '''"limit:''' +
        limit +
        '''){
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
        getArticlesFromCategory(category: "''' +
        category +
        '''", limit:''' +
        limit +
        ''') {
          id
          image
          source
          title
          category
          publishedAt
        }
      }
    ''';
  }

  String getTrending() {
    return '''
      query{
        getTrending{
          id
          title
          description
          image
          category
          source
          publishedAt
        }
      }
    ''';
  }

  String getUserDetails(String uid) {
    return '''query{
      getUserDetail(id:"''' +
        uid +
        '''"){
        id
        name
        email
        profile_url
        intrest
        saved
      }
    }''';
  }

  String addUser(String uid, String name, String email, String profile) {
    return '''
      mutation{
        addUser(uid:"''' +
        uid +
        '''",name:"''' +
        name +
        '''",email:"''' +
        email +
        '''",profile_url:"''' +
        profile +
        '''"){
          id
        }
      }
    ''';
  }

  String getArticles(String term, String limit) {
    return '''
      query{
        getArticles(term:"''' +
        term +
        '''"){
          id
          title
          image
          category
          source
          publishedAt
        }
      }
    ''';
  }

  String getLatest() {
    return '''
      query{
        getLatest{
          id
          title
          description
          image
          category
          source
          publishedAt
        }
      }
    ''';
  }

  String addIntrest(List<String> intrests, String uid) {
    return '''
      mutation{
        addIntrest(intrest:''' +
        intrests.toString() +
        ''',uid:"''' +
        uid +
        '''"){
          id
          intrest
        }
      }
    ''';
  }
}
