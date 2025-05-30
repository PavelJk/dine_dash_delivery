import 'package:dine_dash_delivery/src/feature/auth/screens/info_about_me.dart';
import 'package:dine_dash_delivery/src/feature/auth/screens/otp_code.dart';
import 'package:dine_dash_delivery/src/feature/auth/screens/registr_number.dart';
import 'package:dine_dash_delivery/src/feature/basket/basket.dart';
import 'package:dine_dash_delivery/src/feature/card/screens/product_card.dart';
import 'package:dine_dash_delivery/src/feature/card/screens/restar_card.dart';
import 'package:dine_dash_delivery/src/feature/categories/screens/category.dart';
import 'package:dine_dash_delivery/src/feature/favourites/screens/favourites.dart';
import 'package:dine_dash_delivery/src/feature/history/screen/add_review.dart';
import 'package:dine_dash_delivery/src/feature/history/screen/order.dart';
import 'package:dine_dash_delivery/src/feature/history/screen/review.dart';
import 'package:dine_dash_delivery/src/feature/home/screens/restaurant_home.dart';
import 'package:dine_dash_delivery/src/feature/location/screens/location_access.dart';
import 'package:dine_dash_delivery/src/feature/location/screens/map.dart';
import 'package:dine_dash_delivery/src/feature/menu_categories/screen/menu_category.dart';
import 'package:dine_dash_delivery/src/feature/questions/questions.dart';
import 'package:dine_dash_delivery/src/feature/search/search.dart';
import 'package:dine_dash_delivery/src/feature/setting/screens/info_address.dart';
import 'package:dine_dash_delivery/src/feature/setting/screens/profile.dart';
import 'package:dine_dash_delivery/src/feature/setting/screens/setting_app.dart';
import 'package:dine_dash_delivery/src/feature/tracking/screens/chat.dart';
import 'package:dine_dash_delivery/src/feature/tracking/screens/tracking.dart';
import 'package:dine_dash_delivery/src/feature/transactions/screens/add_card.dart';
import 'package:dine_dash_delivery/src/feature/transactions/screens/payment_method_empty.dart';
import 'package:dine_dash_delivery/src/feature/transactions/screens/payment_successfull.dart';
import 'package:dine_dash_delivery/src/feature/transactions/screens/transaction.dart';
import 'package:dine_dash_delivery/src/feature/video/screen/video.dart';
import 'package:go_router/go_router.dart';

enum AppRoute{
  registrPhone,
  otpCode,
  registrInfoAboutMe,
  locationAccess,
  map,
  mainHome,
  profile,
  setting,
  infoAddress,
  review,
  questions,
  addReviewScreen,
  paymentMethodEmpty,
  myOrder,
  video,
  favorite,
  addCardPayment,
  categories,
  basket,
  search,
  paymentMethodScreen,
  paymentSecefulScreen,
  menuCategories,
  restCard,
  prodCard,
  traking,
  chat,
}

final GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(
      name: AppRoute.registrPhone.name,
      path: '/',
      builder: (context, state) => RegistrNumberScreen(),
      routes: [
        GoRoute(
          name: AppRoute.otpCode.name,
          path: 'otpCode/:phoneNumber',
          builder: (context, state) => OTPCode(
            phoneNumber: state.pathParameters["phoneNumber"]!,
          ),
        ),
        GoRoute(
          name: AppRoute.registrInfoAboutMe.name,
          path: 'registrInfoAboutMe',
          builder: (context, state) => RegistrInfoAboutMe(),
        ),
        GoRoute(
          name: AppRoute.locationAccess.name,
          path: 'locationAccess',
          builder: (context, state) => LocationAccessScreen(),
        ),
        GoRoute(
          name: AppRoute.map.name,
          path: 'map',
          builder: (context, state) => MapScreen(),
        ),
        GoRoute(
          name: AppRoute.mainHome.name,
          path: 'restaurantHome',
          builder: (context, state) => RestaurantHomeScreen(),
        ),
        GoRoute(
          name: AppRoute.profile.name,
          path: 'profile',
          builder: (context, state) => ProfileScreen(),
        ),
        GoRoute(
          name: AppRoute.setting.name,
          path: 'setting',
          builder: (context, state) => SettingsScreen(),
        ),
        GoRoute(
          name: AppRoute.infoAddress.name,
          path: 'infoAddress',
          builder: (context, state) => AddressScreen(),
        ),
        GoRoute(
          name: AppRoute.review.name,
          path: 'review',
          builder: (context, state) => ReviewsScreen(),
        ),
        GoRoute(
          name: AppRoute.questions.name,
          path: 'questions',
          builder: (context, state) => FAQScreen(),
        ),
        GoRoute(
          name: AppRoute.addReviewScreen.name,
          path: 'addReviewScreen/:productName/:productImage',
          builder: (context, state) => AddReviewScreen(
            productName: state.pathParameters["productName"]!,
            productImage: state.pathParameters["productImage"]!,
          ),
        ),
        GoRoute(
          name: AppRoute.paymentMethodEmpty.name,
          path: 'paymentMethodEmpty/:isCard/:cardNumber',
          builder: (context, state) => PaymentMethodEmpty(
            isCard: state.pathParameters["isCard"]!,
            cardNumber: state.pathParameters["cardNumber"]!,
          ),
        ),
        GoRoute(
          name: AppRoute.myOrder.name,
          path: 'myOrder',
          builder: (context, state) => MyOrdersScreen(),
        ),
        GoRoute(
          name: AppRoute.video.name,
          path: 'video',
          builder: (context, state) => VideoRecipesScreen(),
        ),
        GoRoute(
          name: AppRoute.favorite.name,
          path: 'favorite',
          builder: (context, state) => FavoritesScreen(),
        ),
        GoRoute(
          name: AppRoute.addCardPayment.name,
          path: 'addCardPayment/:ismethod/:totalAmount',
          builder: (context, state) => AddCardScreen(
            ismethod: state.pathParameters["ismethod"]!, 
            totalAmount: state.pathParameters["totalAmount"]!,
          ),
        ),
        GoRoute(
          name: AppRoute.categories.name,
          path: 'categories',
          builder: (context, state) => CategoriesScreen(),
        ),
        GoRoute(
          name: AppRoute.basket.name,
          path: 'basket',
          builder: (context, state) => BasketScreen(),
        ),
        GoRoute(
          name: AppRoute.search.name,
          path: 'search',
          builder: (context, state) => SearchScreen(),
        ),
        GoRoute(
          name: AppRoute.paymentMethodScreen.name,
          path: 'paymentMethodScreen/:totalAmount/:isCard/:cardNumber',
          builder: (context, state) => PaymentMethodScreen(
            totalAmount: state.pathParameters["totalAmount"]!, 
            isCard: state.pathParameters["isCard"]!, 
            cardNumber: state.pathParameters["cardNumber"]!, 
          ),
        ),
        GoRoute(
          name: AppRoute.paymentSecefulScreen.name,
          path: 'paymentSecefulScreen',
          builder: (context, state) => PaymentSuccessScreen(),
        ),
        GoRoute(
          name: AppRoute.menuCategories.name,
          path: 'menuCategories/:hor',
          builder: (context, state) => FoodCategoryScreen(
            hor: state.pathParameters["hor"]!,
          ),
        ),
        GoRoute(
          name: AppRoute.restCard.name,
          path: 'restCard/:nameRest/:rating/:deliver/:clock',
          builder: (context, state) => RestaurantDetailPage(
            nameRest: state.pathParameters["nameRest"]!,
            rating: state.pathParameters["rating"]!,
            deliver: state.pathParameters["deliver"]!,
            clock: state.pathParameters["clock"]!,
          ),
        ),
        GoRoute(
          name: AppRoute.prodCard.name,
          path: 'prodCard/:restar/:nameProduct/:price/:image',
          builder: (context, state) => ProductDetailScreen(
            restar: state.pathParameters["restar"]!,
            nameProduct:  state.pathParameters["nameProduct"]!, 
            price: state.pathParameters["price"]!, 
            image: state.pathParameters["image"]!,
          ),
        ),
        GoRoute(
          name: AppRoute.traking.name,
          path: 'traking',
          builder: (context, state) => OrderTrackingCard(),
        ),
        GoRoute(
          name: AppRoute.chat.name,
          path: 'chat',
          builder: (context, state) => CourierChatScreen(),
        ),
      ]
    )
  ]
);