import 'package:portfolio/core/exports.dart';
import 'package:portfolio/widgets/backgound_widgets.dart';
import 'package:portfolio/widgets/custom_button.dart';
import 'package:portfolio/widgets/large_widgets/large_background.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer>
    with SingleTickerProviderStateMixin {
  //
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Drawer(
        backgroundColor: backgroundColor,
        elevation: 0,
        width: width,
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            color: backgroundColor,
          ),
          child: Stack(
            children: [
              const AppDrawerPattern(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          ConstanceData.logo,
                          fit: BoxFit.scaleDown,
                          color: backgroundColor,
                        ),
                        Obx(() {
                          return AnimatedContainer(
                            decoration: BoxDecoration(
                              color: !appController.isOpen.value
                                  ? transparency
                                  : purpleColor,
                              shape: BoxShape.circle,
                            ),
                            duration: const Duration(milliseconds: 500),
                            child: RoundButton(
                              onPressed: () {
                                if (appController.isOpen.value) {
                                  appController.closeDrawer();
                                  _controller.forward();
                                }
                                appController.closeDrawer();
                                _controller.forward();
                              },
                              icon: AnimatedIcon(
                                icon: AnimatedIcons.close_menu,
                                color: theme.backgroundColor,
                                progress: _controller,
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 150),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomTextButton(
                                  icon: ConstanceData.message,
                                  text: 'hello@ui8.net',
                                  onPressed: () {
                                    // send mail
                                  },
                                ),
                                const SizedBox(height: 30),
                                CustomTextButton(
                                  icon: ConstanceData.location,
                                  text:
                                      '4074 Ebert Summit Suite 375\nLake Leonardchester',
                                  onPressed: () {
                                    // send mail
                                  },
                                ),
                                const SizedBox(height: 30),
                                CustomTextButton(
                                  icon: ConstanceData.phone,
                                  text: '+44 123 654 7890',
                                  onPressed: () {
                                    // phone call
                                  },
                                ),
                                const SizedBox(height: 250),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 50),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  //
                                },
                                child: const Text(
                                  "About",
                                  style: TextStyle(
                                    fontSize: 65,
                                    fontWeight: FontWeight.bold,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  //
                                },
                                child: const Text(
                                  "Work",
                                  style: TextStyle(
                                    fontSize: 65,
                                    fontWeight: FontWeight.bold,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  //
                                },
                                child: const Text(
                                  "Services",
                                  style: TextStyle(
                                    fontSize: 65,
                                    fontWeight: FontWeight.bold,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  //
                                },
                                child: const Text(
                                  "Contact",
                                  style: TextStyle(
                                    fontSize: 65,
                                    fontWeight: FontWeight.bold,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialButton(
                          icon: ConstanceData.dribble,
                          title: 'Dribble',
                          onPressed: () {
                            // open dribbble
                          },
                        ),
                        const SizedBox(width: 70),
                        SocialButton(
                          icon: ConstanceData.instagram,
                          title: 'Instagram',
                          onPressed: () {
                            // open instagram
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
