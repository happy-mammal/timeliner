class GqlQueries {
  String getStories() {
    return '''
      query{
        getStories{
          	id
            title
            description
            content
            image
            url
            source
            source_url
            category
            publishedAt
            keywords
        }
      }''';
  }

  String getTrending() {
    return '''
      query{
        getTrending{
          	id
            title
            description
            content
            image
            url
            source
            source_url
            category
            publishedAt
            keywords
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
        content
        image
        url
        source
        source_url
        category
        publishedAt
        keywords
      }
    }
    ''';
  }

  String getArticlesByTerm(List<String> terms) {
    return '''
      query{
        getArticlesByTerm(terms:''' +
        terms.toString() +
        '''){
          	id
            title
            description
            content
            image
            url
            source
            source_url
            category
            publishedAt
            keywords
        }
      }
    ''';
  }

  String getArticlesById(List<String> articleIds) {
    return '''
      query{
        getArticlesById(articleIds:''' +
        articleIds.toString() +
        '''){
          	id
            title
            description
            content
            image
            url
            source
            source_url
            category
            publishedAt
            keywords
        }
      }
    ''';
  }

  String getArticlesFromSource(String source, int limit) {
    return '''
      query{
        getArticlesFromSource(source:"''' +
        source +
        '''"limit:''' +
        limit.toString() +
        '''){
          	id
            title
            description
            content
            image
            url
            source
            source_url
            category
            publishedAt
            keywords
        }
      }
    ''';
  }

  String getArticlesFromCategory(String category, int limit) {
    return '''
      query{
        getArticlesFromCategory(category: "''' +
        category +
        '''", limit:''' +
        limit.toString() +
        ''') {
          	id
            title
            description
            content
            image
            url
            source
            source_url
            category
            publishedAt
            keywords
        }
      }
    ''';
  }

  String getUserDetails(String uid) {
    return '''query{
      getUserDetails(userId:"''' +
        uid +
        '''"){
        userId
        intrests
        saves
        istores
        sstores
      }
    }''';
  }

  String addUser(String uid) {
    return '''
      mutation{
        addUser(userId:"''' +
        uid +
        '''"){
          userId
        }
      }
    ''';
  }

  String addIntrests(List<String> intrests, String uid) {
    return '''
      mutation{
        addIntrests(intrests:''' +
        intrests.toString() +
        ''',userId:"''' +
        uid +
        '''"){
          userId
          intrests
        }
      }
    ''';
  }

  String addSaves(List<String> articleIds, String uid) {
    return '''
      mutation{
        addSaves(articleIds:''' +
        articleIds.toString() +
        ''',userId:"''' +
        uid +
        '''"){
          userId
          saves
        }
      }
    ''';
  }

  String removeIntrests(List<String> intrests, String uid, List<String> stores) {
    return '''
      mutation{
        removeIntrests(intrests:''' +
        intrests.toString() +
        ''',userId:"''' +
        uid +
        '''",stores:''' +
        stores.toString() +
        '''){
          userId
          intrests
        }
      }
    ''';
  }

  String removeSaves(List<String> articleIds, String uid, List<String> stores) {
    print(articleIds);
    print(stores);
    return '''
      mutation{
        removeSaves(articleIds:''' +
        articleIds.toString() +
        ''',userId:"''' +
        uid +
        '''",stores:''' +
        stores.toString() +
        '''){
          userId
          saves
        }
      }
    ''';
  }
}
