import 'package:graphql/client.dart';
import 'package:timeliner/data/dataprovider/gql_client.dart';
import 'package:timeliner/data/dataprovider/gql_queries.dart';

class ArticleRepository {
  GraphQLConfiguration graphQLConfiguration;
  GqlQueries gqlQueries;

  ArticleRepository() {
    this.graphQLConfiguration = GraphQLConfiguration();
    this.gqlQueries = GqlQueries();
  }

  Future<List> fetchStories() async {
    List articleList = [];
    GraphQLClient _client = graphQLConfiguration.myGQLClient();
    QueryResult _result = await _client.query(QueryOptions(document: gql(gqlQueries.getStories())));
    if (_result.hasException) {
      throw Exception([_result.exception]);
    } else if (!_result.hasException) {
      articleList = _result.data["getStories"];
      return articleList;
    } else {
      return articleList;
    }
  }

  Future<List> fetchArticlesFromSource(String source, String limit) async {
    List articleList = [];
    GraphQLClient _client = graphQLConfiguration.myGQLClient();
    QueryResult _result = await _client.query(QueryOptions(document: gql(gqlQueries.getArticlesFromSource(source, limit))));
    if (_result.hasException) {
      throw Exception([_result.exception]);
    } else if (!_result.hasException) {
      articleList = _result.data["getArticlesFromSource"];
      return articleList;
    } else {
      return articleList;
    }
  }

  Future<List> fetchArticlesFromCategory(String category, String limit) async {
    List articleList = [];
    GraphQLClient _client = graphQLConfiguration.myGQLClient();
    QueryResult _result = await _client.query(QueryOptions(document: gql(gqlQueries.getArticlesFromCategory(category, limit))));
    if (_result.hasException) {
      throw Exception([_result.exception]);
    } else if (!_result.hasException) {
      articleList = _result.data["getArticlesFromCategory"];
      return articleList;
    } else {
      return articleList;
    }
  }

  Future<List> fetchTrending() async {
    List articleList = [];
    GraphQLClient _client = graphQLConfiguration.myGQLClient();
    QueryResult _result = await _client.query(QueryOptions(document: gql(gqlQueries.getTrending())));
    if (_result.hasException) {
      throw Exception([_result.exception]);
    } else if (!_result.hasException) {
      articleList = _result.data["getTrending"];
      return articleList;
    } else {
      return articleList;
    }
  }

  Future<List> fetchLatest() async {
    List articleList = [];
    GraphQLClient _client = graphQLConfiguration.myGQLClient();
    QueryResult _result = await _client.query(QueryOptions(document: gql(gqlQueries.getLatest())));
    if (_result.hasException) {
      throw Exception([_result.exception]);
    } else if (!_result.hasException) {
      articleList = _result.data["getLatest"];
      return articleList;
    } else {
      return articleList;
    }
  }

  Future<List> fetchArticles(String term, String limit) async {
    List articleList = [];
    GraphQLClient _client = graphQLConfiguration.myGQLClient();
    QueryResult _result = await _client.query(QueryOptions(document: gql(gqlQueries.getArticles(term, limit))));
    if (_result.hasException) {
      throw Exception([_result.exception]);
    } else if (!_result.hasException) {
      articleList = _result.data["getArticles"];
      return articleList;
    } else {
      return articleList;
    }
  }
}
