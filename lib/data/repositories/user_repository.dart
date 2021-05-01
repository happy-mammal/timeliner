import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graphql/client.dart';
import 'package:timeliner/data/dataprovider/gql_client.dart';
import 'package:timeliner/data/dataprovider/gql_queries.dart';

class UserRepository {
  FirebaseAuth firebaseAuth;
  GraphQLConfiguration graphQLConfiguration;
  GqlQueries gqlQueries;

  UserRepository() {
    this.firebaseAuth = FirebaseAuth.instance;
    this.graphQLConfiguration = GraphQLConfiguration();
    this.gqlQueries = GqlQueries();
  }

  Future<User> authWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    final UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);
    return userCredential.user;
  }

  Future<void> signOutUser() async {
    await firebaseAuth.signOut();
  }

  Future<User> getCurrentUser() async {
    return firebaseAuth.currentUser;
  }

  Future<bool> isSignedIn() async {
    var currentUser = firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<bool> isUserExists(String uid) async {
    GraphQLClient _client = graphQLConfiguration.myGQLClient();
    QueryResult _result = await _client.query(QueryOptions(document: gql(gqlQueries.getUserDetails(uid))));
    if (_result.hasException) {
      throw Exception([_result.exception]);
    } else if (!_result.hasException) {
      return _result.data["getUserDetail"]["id"] != null ? true : false;
    } else {
      return false;
    }
  }

  Future<Map<String, dynamic>> fetchUserDetails(String uid) async {
    GraphQLClient _client = graphQLConfiguration.myGQLClient();
    QueryResult _result = await _client.query(QueryOptions(document: gql(gqlQueries.getUserDetails(uid))));
    if (_result.hasException) {
      throw Exception([_result.exception]);
    } else if (!_result.hasException) {
      return _result.data["getUserDetail"];
    } else {
      return null;
    }
  }

  Future<List> createUserAccount(String uid, String name, String email, String profile) async {
    GraphQLClient _client = graphQLConfiguration.myGQLClient();
    QueryResult _result = await _client.query(QueryOptions(document: gql(gqlQueries.addUser(uid, name, email, profile))));
    if (_result.hasException) {
      throw Exception([_result.exception]);
    } else if (!_result.hasException) {
      return [_result.data["addUser"]];
    } else {
      return null;
    }
  }

  Future<List> addIntrests(List<String> intrests, String uid) async {
    GraphQLClient _client = graphQLConfiguration.myGQLClient();
    QueryResult _result = await _client.query(QueryOptions(document: gql(gqlQueries.addIntrest(intrests, uid))));
    if (_result.hasException) {
      throw Exception([_result.exception]);
    } else if (!_result.hasException) {
      return [_result.data["addIntrest"]];
    } else {
      return null;
    }
  }
}
