import 'package:graphql/client.dart';

class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink("https://timeliner-gql-api.herokuapp.com/api");

  GraphQLClient myGQLClient() {
    return GraphQLClient(link: httpLink, cache: GraphQLCache());
  }
}
