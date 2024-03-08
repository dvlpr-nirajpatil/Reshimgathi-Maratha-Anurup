import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/controllers/search_controller.dart';
import 'package:reshimgathi/utility/util_functions.dart';
import 'package:reshimgathi/views/profile_details_screen/profile_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});
  static const String id = "SearchScreen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchField = TextEditingController();
  FocusNode _searchFieldFocusNode = FocusNode();
  bool showClearButton = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchField.addListener(() {
      setState(() {
        searchField.text.length > 0
            ? showClearButton = true
            : showClearButton = false;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_searchFieldFocusNode);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchFieldFocusNode.dispose();
    searchField.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var controller =
        Provider.of<SearchProfilesController>(context, listen: false);
    return Scaffold(
      body: Container(
        width: context.width,
        padding: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  weight: 1,
                ).onTap(() {
                  GoRouter.of(context).pop();
                }),
                10.widthBox,
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onSubmitted: (value) {
                            controller.searchProfiles(value);
                          },
                          textInputAction: TextInputAction.done,
                          focusNode: _searchFieldFocusNode,
                          controller: searchField,
                          decoration: InputDecoration(
                            hintText: "Search ",
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      showClearButton
                          ? Icon(
                              Icons.close,
                            ).onTap(() {
                              searchField.clear();
                            })
                          : SizedBox(),
                    ],
                  )
                      .box
                      .color(Colors.grey.shade100.withAlpha(100))
                      .border(color: borderColor)
                      .customRounded(BorderRadius.circular(4))
                      .padding(EdgeInsets.symmetric(horizontal: 10))
                      .make(),
                )
              ],
            ).paddingSymmetric(horizontal: 20),
            Divider(
              thickness: 0.5,
            ),
            Expanded(
              child: Consumer<SearchProfilesController>(
                  builder: (context, controller, x) {
                return controller.searchResults.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.heightBox,
                          "Matched Result"
                              .text
                              .fontFamily(semiBold)
                              .make()
                              .paddingSymmetric(horizontal: 20),
                          20.heightBox,
                          Expanded(
                            child: ListView.separated(
                              padding: EdgeInsets.all(0),
                              separatorBuilder: (context, index) => Divider(
                                thickness: 0.5,
                                color: borderColor,
                              ),
                              itemCount: controller.searchResults.length,
                              itemBuilder: (context, index) {
                                var data = controller.searchResults[index];
                                return searchResultTile(data);
                              },
                            ),
                          ),
                        ],
                      )
                    : "${controller.error}".text.make().centered();
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget searchResultTile(DocumentSnapshot<Object?> data) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: data['images'][0],
        )
            .box
            .roundedFull
            .size(50, 50)
            .customRounded(
              BorderRadius.circular(6),
            )
            .clip(Clip.antiAlias)
            .make(),
        20.widthBox,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "${data['first_name']} ${data['last_name']}, ${calculateAge(data)} "
                  .text
                  .fontFamily(semiBold)
                  .make(),
              "${data['education']}, ${data['city']}, ${data['marital_status']}"
                  .text
                  .make(),
            ],
          ),
        )
      ],
    ).paddingSymmetric(horizontal: 20).onTap(
      () {
        GoRouter.of(context).pushNamed(ProfileDetailScreen.id,
            pathParameters: {'id': data['uid']});
      },
    );
  }
}
