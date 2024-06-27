import 'package:day_25_26_06_2024/src/config/theme/color.dart';
import 'package:day_25_26_06_2024/src/config/theme/style.dart';
import 'package:day_25_26_06_2024/src/core/common/widgets/appbar.dart';
import 'package:day_25_26_06_2024/src/core/common/widgets/background_filter.dart';
import 'package:day_25_26_06_2024/src/core/common/widgets/circle_button_appbar.dart';
import 'package:day_25_26_06_2024/src/core/common/widgets/elevated_button.dart';
import 'package:day_25_26_06_2024/src/core/common/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import '../../../../../core/common/animations/fade.dart';
import '../../../../../core/constants/size.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Container(
          padding: hAppDefaultPaddingL,
          alignment: Alignment.center,
          child: HBlurCircleIcon(
              onTap: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20,
              )),
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              HBlurCircleIcon(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 20,
                  )),
              gapW16,
            ],
          )
        ],
      ),
      body: _buildBackgroundImage(context),
    );
  }

  Column _buildTitleAndFormSignUp(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        gapH16,
        _buildFormSignUp(context),
        gapH100,
        _buildBottomText(context),
        gapH16,
      ],
    );
  }

  Widget _buildTitle() {
    return const HFadeAnimation(
      delay: 1,
      child: Text('Sign up', style: HAppStyle.heading2Style),
    );
  }

  _buildFormSignUp(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: hAppDefaultPaddingLR,
      child: Column(
        children: [
          const HFadeAnimation(
              delay: 1.2,
              child: HTextFormField(
                icon: Icon(
                  Icons.person_2_sharp,
                  size: 20,
                  color: HAppColor.greyColor,
                ),
                hintText: 'First name',
              )),
          gapH10,
          const HFadeAnimation(
              delay: 1.3,
              child: HTextFormField(
                icon: Icon(
                  Icons.person_2_sharp,
                  size: 20,
                  color: HAppColor.greyColor,
                ),
                hintText: 'Last name',
              )),
          gapH10,
          const HFadeAnimation(
              delay: 1.4,
              child: HTextFormField(
                icon: Icon(
                  Icons.lock,
                  size: 20,
                  color: HAppColor.greyColor,
                ),
                hintText: 'Email',
              )),
          gapH10,
          const HFadeAnimation(
            delay: 1.5,
            child: HTextFormField(
              icon: Icon(
                Icons.lock,
                size: 20,
                color: HAppColor.greyColor,
              ),
              isPassword: true,
              hintText: 'Password',
            ),
          ),
          gapH10,
          const HFadeAnimation(
            delay: 1.6,
            child: HTextFormField(
              icon: Icon(
                Icons.lock,
                size: 20,
                color: HAppColor.greyColor,
              ),
              isPassword: true,
              hintText: 'Confirm password',
            ),
          ),
          gapH24,
          HFadeAnimation(
            delay: 1.7,
            child: SizedBox(
              height: 50,
              width: width,
              child: HElevatedButton(
                  onPressed: () {}, child: const Text('Sign Up')),
            ),
          ),
        ],
      ),
    );
  }

  _buildBottomText(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/Login');
      },
      child: HFadeAnimation(
        delay: 1.8,
        child: Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                  text: 'Already have an account? ',
                  style: HAppStyle.paragraph2Regular),
              TextSpan(
                  text: 'Login',
                  style: HAppStyle.label3Bold
                      .copyWith(color: HAppColor.bluePrimaryColor)),
            ],
          ),
        ),
      ),
    );
  }

  _buildBackgroundImage(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 190,
          backgroundColor: HAppColor.otherColor,
          leading: const SizedBox(),
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background_welcome.jpg'),
                      fit: BoxFit.cover)),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                      HAppColor.otherColor,
                      HAppColor.otherColor.withOpacity(.3)
                    ])),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: hAppDefaultPaddingLTRB,
                    child: _buildTitle(),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: hAppDefaultPaddingLTRB,
              child: _buildTitleAndFormSignUp(context),
            )
          ]),
        )
      ],
    );
  }
}
