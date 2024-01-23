import 'package:reshimgathi/consts/consts.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore database = FirebaseFirestore.instance;
User? user = auth.currentUser;

// collection
const String registerCollection = "userRegister";
const String adminCollection = "adminRegister";
