

// import 'package:flutter/material.dart';

// Route<dynamic> generateRoute(RouteSettings routeSettings) {
//   switch (routeSettings.name) {
//     case ForgotPasswordScreen.routeName:
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         return FadeTransition(
//           opacity: animation,
//           child: const ForgotPasswordScreen(),
//         );
//       });

//     case ResetPasswordScreen.routeName:
//       var email = routeSettings.arguments as String;
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         return FadeTransition(
//           opacity: animation,
//           child: ResetPasswordScreen(
//             email: email,
//           ),
//         );
//       });

//     case RegisterScreen.routeName:
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         return FadeTransition(
//           opacity: animation,
//           child: const RegisterScreen(),
//         );
//       });

//     case LoginScreen.routeName:
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         return FadeTransition(
//           opacity: animation,
//           child: LoginScreen(),
//         );
//       });

//     case MembershipScreen.routeName:
//       var isEdit = routeSettings.arguments as bool;
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         return FadeTransition(
//           opacity: animation,
//           child: MembershipScreen(
//             isEdit: isEdit,
//           ),
//         );
//       });

//     case VerificationScreen.routeName:
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         var verificationArgs = routeSettings.arguments as VerificationArguments;
//         return FadeTransition(
//           opacity: animation,
//           child: VerificationScreen(
//             email: verificationArgs.email,
//             isResetPassword: verificationArgs.isResetPassword,
//           ),
//         );
//       });

//     case HomeScreen.routeName:
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         return FadeTransition(
//           opacity: animation,
//           child: HomeScreen(),
//         );
//       });

//     case BookScreen.routeName:
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         return FadeTransition(
//           opacity: animation,
//           child: BookScreen(),
//         );
//       });

//     case BookDetailsScreen.routeName:
//       var book = routeSettings.arguments as Book;
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         return FadeTransition(
//           opacity: animation,
//           child: BookDetailsScreen(
//             book: book,
//           ),
//         );
//       });

//     case ReserveBookScreen.routeName:
//       var book = routeSettings.arguments as Book;
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         return FadeTransition(
//           opacity: animation,
//           child: ReserveBookScreen(
//             book: book,
//           ),
//         );
//       });

//     case SpaceScreen.routeName:
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         return FadeTransition(
//           opacity: animation,
//           child: SpaceScreen(),
//         );
//       });

//     case SpaceDetailsScreen.routeName:
//       var space = routeSettings.arguments as Space;
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         return FadeTransition(
//           opacity: animation,
//           child: SpaceDetailsScreen(
//             space: space,
//           ),
//         );
//       });

//     case ReserveSpaceScreen.routeName:
//       var space = routeSettings.arguments as Space;
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         return FadeTransition(
//           opacity: animation,
//           child: ReserveSpaceScreen(
//             space: space,
//           ),
//         );
//       });

//     case ProfileScreen.routeName:
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         return FadeTransition(
//           opacity: animation,
//           child: ProfileScreen(),
//         );
//       });

//     case FaqsScreen.routeName:
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         return FadeTransition(
//           opacity: animation,
//           child: FaqsScreen(),
//         );
//       });

//     case EventScreen.routeName:
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         return FadeTransition(
//           opacity: animation,
//           child: EventScreen(),
//         );
//       });

//     case EventDetailsScreen.routeName:
//       var event = routeSettings.arguments as Event;
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         return FadeTransition(
//           opacity: animation,
//           child: EventDetailsScreen(
//             event: event,
//           ),
//         );
//       });

//     case EditPersonal.routeName:
//       var editArg = routeSettings.arguments as EditPersonalArguments;
//       return PageRouteBuilder(
//           opaque: false,
//           pageBuilder: (_, animation, __) {
//             return FadeTransition(
//               opacity: animation,
//               child: EditPersonal(
//                 codeKey: editArg.codeKey,
//                 value: editArg.value,
//                 onSuccess: editArg.onSuccess,
//               ),
//             );
//           });

//     case SearchScreen.routeName:
//       return PageRouteBuilder(
//           opaque: false,
//           pageBuilder: (_, animation, __) {
//             return FadeTransition(opacity: animation, child: SearchScreen());
//           });

//     case ReserveCalendar.routeName:
//       var reserveCalendarArg =
//           routeSettings.arguments as ReserveCalendarArguments;
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         return FadeTransition(
//           opacity: animation,
//           child: ReserveCalendar(
//             item: reserveCalendarArg.item,
//             itemType: reserveCalendarArg.itemType,
//           ),
//         );
//       });

//     case SummaryReservation.routeName:
//       var slotTime = routeSettings.arguments as SummaryReservationArg;
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         return FadeTransition(
//           opacity: animation,
//           child: SummaryReservation(
//             date: slotTime.date,
//             startTime: slotTime.startTime,
//             endTime: slotTime.endTime,
//             item: slotTime.item,
//             itemType: slotTime.itemType,
//           ),
//         );
//       });

//     case SetTimeSlot.routeName:
//       var setTime = routeSettings.arguments as SetTimeArg;
//       return PageRouteBuilder(
//           opaque: false,
//           pageBuilder: (_, animation, __) {
//             return FadeTransition(
//               opacity: animation,
//               child: SetTimeSlot(
//                 date: setTime.date,
//                 item: setTime.item,
//                 itemType: setTime.itemType,
//               ),
//             );
//           });

//     case QrcodeScannerScreen.routeName:
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         return FadeTransition(opacity: animation, child: QrcodeScannerScreen());
//       });

//     case QrcodeScannerResultScreen.routeName:
//       var isVerifyUserPlan = routeSettings.arguments as bool;
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         return FadeTransition(
//             opacity: animation,
//             child: QrcodeScannerResultScreen(
//               isVerifyUserPlan: isVerifyUserPlan,
//             ));
//       });

//     case NotificationScreen.routeName:
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         return FadeTransition(opacity: animation, child: NotificationScreen());
//       });

//     case CustomErrorModal.routeName:
//       return PageRouteBuilder(
//           opaque: false,
//           pageBuilder: (_, animation, __) {
//             return FadeTransition(
//               opacity: animation,
//               child: CustomErrorModal(),
//             );
//           });

//     case ChangeLanguage.routeName:
//       return PageRouteBuilder(
//           opaque: false,
//           pageBuilder: (_, animation, __) {
//             return FadeTransition(
//               opacity: animation,
//               child: ChangeLanguage(),
//             );
//           });

//     case SearchEventScreen.routeName:
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         return FadeTransition(opacity: animation, child: SearchEventScreen());
//       });

//     case FilterEventScreen.routeName:
//       return PageRouteBuilder(
//           opaque: false,
//           pageBuilder: (_, animation, __) {
//             return FadeTransition(
//                 opacity: animation, child: FilterEventScreen());
//           });

//     case SearchEventResultScreen.routeName:
//       var events = routeSettings.arguments as List<Event>;
//       return PageRouteBuilder(pageBuilder: (_, animation, __) {
//         return FadeTransition(
//             opacity: animation,
//             child: SearchEventResultScreen(
//               events: events,
//             ));
//       });
//     default:
//       return MaterialPageRoute(
//           builder: (_) => const Scaffold(
//                 body: Center(
//                   child: Text("404"),
//                 ),
//               ));
//   }
// }
