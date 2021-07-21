import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lost_found_pet_prototype/api/abstract_user_api.dart';
import 'package:lost_found_pet_prototype/router.dart';
import 'package:lost_found_pet_prototype/service_locator.dart';
import 'package:lost_found_pet_prototype/theme/brand_theme.dart';
import 'package:lost_found_pet_prototype/view_model/auth_model.dart';
import 'package:lost_found_pet_prototype/view_model/navigation_model.dart';
import 'package:lost_found_pet_prototype/view_model/post_list_model.dart';
import 'package:lost_found_pet_prototype/view_model/post_model.dart';
import 'package:lost_found_pet_prototype/view_model/tab_model.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GlobalNavigation>.value(
          value: GlobalNavigation(value: _navigatorKey),
        ),
        StreamProvider<FirebaseUser>.value(
          value: locator<AbstractUserApi>().authUser,
          initialData: null,
        ),
        Provider<AuthModel>(
          create: (_) => locator<AuthModel>(),
        ),
        ChangeNotifierProvider<TabModel>(
          create: (_) => locator<TabModel>(),
        ),
        ChangeNotifierProvider<FoundPostListModel>(
          create: (_) => locator<FoundPostListModel>(),
        ),
        ChangeNotifierProvider<LostPostListModel>(
          create: (_) => locator<LostPostListModel>(),
        ),
        ChangeNotifierProxyProvider<FirebaseUser, UserPostListModel>(
          update: (context, value, previous) => locator<UserPostListModel>(),
          create: (firebaseUser) => locator<UserPostListModel>(),
        ),
        ChangeNotifierProvider<CreatePostModel>(
          create: (_) => locator<CreatePostModel>(),
        ),
        ChangeNotifierProvider<SelectedPostModel>(
          create: (_) => locator<SelectedPostModel>(),
        ),
      ],
      child: MaterialApp(
        title: 'LostAndFound',
        theme: kBrandTheme,
        navigatorKey: _navigatorKey,
        initialRoute: AppRouter.initialRoute,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
