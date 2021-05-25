# TimeLiner
A simple interest tracking app which tries/aims to provide real-time history feed of interests you like e.g. (iPhone13, Tesla, Covid-19). It similar to a customized RSS feed but a mixture of news and feed app which is simple, clean and elegant to use.

 - You can search for articles/news.
 - You get a curated feed based on topics you choose while setting up the account.
 - Add your intrests and get your feed tracking started in Intrest's Library.
 - Save articles you like to your Savelist.
 - An overall hybrid mixture of news + rss feed app with an added feature of savelist and intrest library.
 - Simple and easy and elegant to use with a very clean looking UI having no shitty and annoying content.

## Implementations
  - Bloc Architecture
  - Firebase Auth with Google Sign In
  - Neomorphic UI Design 
  - Self Hosted GraphQL API (to know more check out this repo: https://github.com/happy-mammal/timeliner-graphql-api)
  - Shimmer Effects
  - Aesthetic UI Design Approach

## Features
  - Has both Dark & Light Mode
  - Clean & Easy Navigation
  - Curated Feed consist of (Breaking News,For Your,Trending Hot,Stories,Latest News, etc.)
  - Simple and fast search.
  - Intrest Library (Similar to youtubes subscription's page/screen) & Savelist
  - Neomorphic looks.

## Folder Structure
  ```
  .
├── business_logic
│   ├── blocs
│   │   ├── auth
│   │   │   ├── auth_bloc.dart
│   │   │   ├── auth_event.dart
│   │   │   └── auth_state.dart
│   │   └── user
│   │       ├── user_bloc.dart
│   │       ├── user_event.dart
│   │       └── user_state.dart
│   └── cubits
│       ├── app_theme
│       │   ├── app_theme_cubit.dart
│       │   └── app_theme_state.dart
│       ├── curated_category
│       │   ├── curated_category_cubit.dart
│       │   └── curated_category_state.dart
│       ├── curated_source
│       │   ├── curated_source_cubit.dart
│       │   └── curated_source_state.dart
│       ├── get_intrests
│       │   ├── get_intrests_cubit.dart
│       │   └── get_intrests_state.dart
│       ├── get_saved_articles
│       │   ├── get_saved_articles_cubit.dart
│       │   └── get_saved_articles_state.dart
│       ├── get_stories
│       │   ├── get_stories_cubit.dart
│       │   └── get_stories_state.dart
│       ├── get_trending
│       │   ├── get_trending_cubit.dart
│       │   └── get_trending_state.dart
│       └── search
│           ├── search_cubit.dart
│           └── search_state.dart
├── data
│   ├── dataprovider
│   │   ├── gql_client.dart
│   │   └── gql_queries.dart
│   └── repositories
│       ├── article_repository.dart
│       └── user_repository.dart
├── presentation
│   ├── pages
│   │   ├── auth.dart
│   │   ├── feed.dart
│   │   ├── home.dart
│   │   ├── library.dart
│   │   ├── profile.dart
│   │   ├── saves.dart
│   │   ├── search.dart
│   │   ├── setup.dart
│   │   └── view_article.dart
│   ├── routes
│   │   └── app_route.dart
│   ├── themes
│   │   └── app_theme.dart
│   └── widgets
│       ├── card_image.dart
│       ├── checkbox_card.dart
│       ├── chip_button.dart
│       ├── feed_card.dart
│       ├── intrest_chip.dart
│       ├── profile_button.dart
│       ├── responsive_text.dart
│       ├── search_bar.dart
│       ├── shimmer_card.dart
│       ├── side_bar_button.dart
│       ├── side_bar.dart
│       └── suggestion_card.dart
├── utils
│   └── colors.dart
├── generated_plugin_registrant.dart
└── main.dart
  ```
## UI/UI (Screenshots)
  - Light Mode/Theme
    ![UI6](https://user-images.githubusercontent.com/78479679/117343549-07a3dd00-aec2-11eb-998d-a7d97e5066b3.PNG)
    ![UI7](https://user-images.githubusercontent.com/78479679/117343567-0b376400-aec2-11eb-8632-c6add76df532.PNG)
    ![UI8](https://user-images.githubusercontent.com/78479679/117343580-0d012780-aec2-11eb-8831-387b58000086.PNG)
    ![UI9](https://user-images.githubusercontent.com/78479679/117343584-0e325480-aec2-11eb-859f-77a138317119.PNG)
    ![UI10](https://user-images.githubusercontent.com/78479679/117343587-0f638180-aec2-11eb-9c63-4a4583fc85fb.PNG)
    
  - Dark Mode/Theme
    ![UI1](https://user-images.githubusercontent.com/78479679/117343680-2904c900-aec2-11eb-9eeb-0c4ce46a9c0e.PNG)
    ![UI2](https://user-images.githubusercontent.com/78479679/117343686-2ace8c80-aec2-11eb-9bcc-e38a312b9c29.PNG)
    ![UI3](https://user-images.githubusercontent.com/78479679/117343690-2b672300-aec2-11eb-8853-a51181faf2c3.PNG)
    ![UI4](https://user-images.githubusercontent.com/78479679/117343694-2bffb980-aec2-11eb-9a76-7f03abfb5eed.PNG)
    ![UI5](https://user-images.githubusercontent.com/78479679/117343698-2c985000-aec2-11eb-9d58-3ffcef3f465b.PNG)

## Check Out The Other Dependent Repos
  - https://github.com/happy-mammal/timeliner-graphql-api
  - https://github.com/happy-mammal/timeliner-worker-service
