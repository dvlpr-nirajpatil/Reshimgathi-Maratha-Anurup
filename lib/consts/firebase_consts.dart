import 'package:firebase_storage/firebase_storage.dart';
import 'package:reshimgathi/consts/consts.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore database = FirebaseFirestore.instance;
User? user = auth.currentUser;
FirebaseStorage storage = FirebaseStorage.instance;

// collection
const String registerCollection = "userRegister";
const String adminCollection = "adminRegister";
const String saveProfilesCollection = "savedProfiles";
const String infoRequestCollection = "infoRequests";
