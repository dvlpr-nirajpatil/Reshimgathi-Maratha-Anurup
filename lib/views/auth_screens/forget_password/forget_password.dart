import 'package:reshimgathi/consts/consts.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var authController = Provider.of<AuthController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: screenPadding,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.height * 0.02,
              ),
              "Reset your password".text.size(24).semiBold.make(),
              SizedBox(
                height: context.height * 0.1,
              ),
              customTextFormField(
                required: true,
                label: "Email",
                controller: _emailField,
              ),
              SizedBox(
                height: context.height * 0.04,
              ),
              Consumer<AuthController>(
                builder: (context, controller, xxx) {
                  return FilledButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        controller.isLoading = true;
                        // Form is valid, perform sign-in logic here
                        String email = _emailField.text.trimRight();
                        authController.forgetPassword(context, email);
                      }
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          controller.isLoading = false;
                        },
                      );
                    },
                    child: controller.isloading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : "Reset Password"
                            .text
                            .fontFamily(semiBold)
                            .size(16)
                            .make(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
