import 'package:day_25_26_06_2024/src/config/theme/color.dart';
import 'package:day_25_26_06_2024/src/config/theme/style.dart';
import 'package:day_25_26_06_2024/src/core/common/widgets/background_filter.dart';
import 'package:day_25_26_06_2024/src/core/common/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import '../../../../../core/common/animations/fade.dart';
import '../../../../../core/constants/size.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBackgroundImage(context),
    );
  }

  Column _buildAllButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[gapH16, _buildButtons(context), gapH16],
    );
  }

  Widget _buildTitle() {
    return HFadeAnimation(
        delay: 1,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: 'Start Streaming Now\n',
                  style: HAppStyle.heading2Style.copyWith(
                      color: const Color.fromARGB(255, 200, 200, 200))),
              TextSpan(
                  text: 'with',
                  style: HAppStyle.heading2Style.copyWith(
                      color: const Color.fromARGB(255, 200, 200, 200))),
              TextSpan(
                  text: ' BlackTV',
                  style: HAppStyle.heading1Style
                      .copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          textAlign: TextAlign.center,
        ));
  }

  _buildButtons(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: hAppDefaultPaddingLR,
      child: Column(
        children: [
          HFadeAnimation(
              delay: 1.2,
              child: SizedBox(
                width: width,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Login');
                  },
                  child: Text(
                    'Log In',
                    style: HAppStyle.label2Bold
                        .copyWith(color: HAppColor.whileColor),
                  ),
                ),
              )),
          gapH10,
          HFadeAnimation(
            delay: 1.3,
            child: SizedBox(
              width: width,
              height: 50,
              child: OutlinedButton(
                onPressed: () {},
                child: Row(children: [
                  const Expanded(
                      flex: 1,
                      child: Padding(
                        padding: hAppDefaultPaddingR,
                        child: Icon(
                          Icons.apple_rounded,
                          color: HAppColor.whileColor,
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Text(
                        'Log In via Apple',
                        style: HAppStyle.label2Bold
                            .copyWith(color: HAppColor.whileColor),
                      ))
                ]),
              ),
            ),
          ),
          gapH10,
          HFadeAnimation(
            delay: 1.4,
            child: SizedBox(
              width: width,
              height: 50,
              child: OutlinedButton(
                onPressed: () {},
                child: Row(children: [
                  const Expanded(
                      flex: 1,
                      child: Padding(
                        padding: hAppDefaultPaddingR,
                        child: Icon(
                          Icons.facebook,
                          color: HAppColor.whileColor,
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Text(
                        'Log In via Facebook',
                        style: HAppStyle.label2Bold
                            .copyWith(color: HAppColor.whileColor),
                      ))
                ]),
              ),
            ),
          ),
          gapH10,
          HFadeAnimation(
              delay: 1.5,
              child: SizedBox(
                width: width,
                height: 50,
                child: HElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/SignUp');
                    },
                    child: const Text(
                      'Sign Up',
                    )),
              )),
        ],
      ),
    );
  }

  _buildBackgroundImage(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 500,
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
              child: _buildAllButton(context),
            )
          ]),
        )
      ],
    );
  }
}
