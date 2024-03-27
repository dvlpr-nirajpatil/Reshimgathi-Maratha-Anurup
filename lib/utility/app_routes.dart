import 'package:go_router/go_router.dart';
import 'package:reshimgathi/views/auth_screens/landing_screen/landing_screen.dart';
import 'package:reshimgathi/views/auth_screens/signin_screen/signin_screen.dart';
import 'package:reshimgathi/views/auth_screens/signup_screen/signup_screen.dart';
import 'package:reshimgathi/views/auth_screens/splash_screen/splash_screen.dart';
import 'package:reshimgathi/views/home-screen/set_pref/set_preferences_screen.dart';
import 'package:reshimgathi/views/home/home.dart';
import 'package:reshimgathi/views/payment_gateway/payment_screen.dart';
import 'package:reshimgathi/views/profile/change_password/change_password_screen.dart';
import 'package:reshimgathi/views/profile/manage_membership/manage_membership_screen.dart';
import 'package:reshimgathi/views/profile/update_information/update_information.dart';
import 'package:reshimgathi/views/profile_details_screen/profile_detail_screen.dart';
import 'package:reshimgathi/views/profile_registration_form/contact_info_screen.dart';
import 'package:reshimgathi/views/profile_registration_form/expection_info_screen.dart';
import 'package:reshimgathi/views/profile_registration_form/family_info_screen.dart';
import 'package:reshimgathi/views/profile_registration_form/personal_info_screen.dart';
import 'package:reshimgathi/views/profile_registration_form/professional_info_registration_screen.dart';
import 'package:reshimgathi/views/profile_registration_form/registration_screen.dart';
import 'package:reshimgathi/views/profile_registration_form/residential_info_screen.dart';
import 'package:reshimgathi/views/profile_registration_form/terms_and_conditions.dart';
import 'package:reshimgathi/views/profile_registration_form/upload_document.dart';
import 'package:reshimgathi/views/profile_registration_form/upload_photos_screen.dart';
import 'package:reshimgathi/views/profile_registration_form/verification_waiting_screen.dart';
import 'package:reshimgathi/views/search_screen/search_screen.dart';

class AppRoutes {
  static GoRouter router = GoRouter(
    routes: [
      // Splash Screen
      GoRoute(
        path: '/',
        name: SplashScreen.id,
        builder: (context, state) => SplashScreen(),
      ),
      // Landing Screen
      GoRoute(
        path: '/landing',
        name: LandingScreen.id,
        builder: (context, state) => const LandingScreen(),
      ),
      // Sign In Screen
      GoRoute(
        path: '/signin',
        name: SignInScreen.id,
        builder: (context, state) => SignInScreen(),
        routes: [
          GoRoute(
            path: 'signup',
            name: SignupScreen.id,
            builder: ((context, state) => SignupScreen()),
          )
        ],
      ),
      // Terms And Condions Screen
      GoRoute(
        path: '/termsandconditions',
        name: TermsAndConditions.id,
        builder: ((context, state) => TermsAndConditions()),
      ),
      // Registration Screen
      GoRoute(
        path: '/registration',
        name: RegistrationScreen.id,
        builder: ((context, state) => RegistrationScreen()),
        routes: [
          GoRoute(
            path: 'personalinfo',
            name: PersonalInformationScreen.id,
            builder: (context, state) => PersonalInformationScreen(),
          ),
          GoRoute(
            path: 'professionalinfo',
            name: ProfessionalInfoScreen.id,
            builder: (context, state) => ProfessionalInfoScreen(),
          ),
          GoRoute(
            path: 'familybackground',
            name: FamilyInfoScreen.id,
            builder: (context, state) => FamilyInfoScreen(),
          ),
          GoRoute(
            path: 'residential',
            name: ResidentialInfoScreen.id,
            builder: (context, state) => ResidentialInfoScreen(),
          ),
          GoRoute(
            path: 'contactdetails',
            name: ContactInfoScreen.id,
            builder: (context, state) => ContactInfoScreen(),
          ),
          GoRoute(
            path: 'expectations',
            name: ExpectionScreen.id,
            builder: (context, state) => ExpectionScreen(),
          ),
          GoRoute(
            path: 'uploadphotos',
            name: UploadPhotosScreen.id,
            builder: (context, state) => UploadPhotosScreen(),
          ),
          GoRoute(
            path: 'uploaddocs',
            name: UploadDocumentScreen.id,
            builder: (context, state) => UploadDocumentScreen(),
          ),
        ],
      ),
      // Verification pending Screen
      GoRoute(
        path: '/verificationpending',
        name: VerificationPendingScreen.id,
        builder: (context, state) => VerificationPendingScreen(),
      ),
      GoRoute(
        path: '/membership',
        name: MembershipScreen.id,
        builder: (context, state) => MembershipScreen(),
      ),

      GoRoute(
        path: '/homeScreen',
        name: Home.id,
        builder: (context, state) => Home(),
        routes: [
          GoRoute(
            path: 'search',
            name: SearchScreen.id,
            builder: (context, state) => SearchScreen(),
          ),
          GoRoute(
            path: 'setpref',
            name: SetPreferencesScreen.id,
            builder: (context, state) => SetPreferencesScreen(),
          ),
          GoRoute(
            path: 'profile/:id',
            name: ProfileDetailScreen.id,
            builder: (context, state) => ProfileDetailScreen(
              userid: state.pathParameters['id']!,
            ),
          ),
          GoRoute(
            path: 'updateinformation',
            name: UpdateInformationScreen.id,
            builder: (context, state) => UpdateInformationScreen(),
          ),
          GoRoute(
            path: 'changepassword',
            name: ChangePasswordScreen.id,
            builder: (context, state) => ChangePasswordScreen(),
          ),
          GoRoute(
            path: 'managemembership',
            name: ManageMembershipScreen.id,
            builder: (context, state) => ManageMembershipScreen(),
          ),
        ],
      ),
    ],
  );
}
