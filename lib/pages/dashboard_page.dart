import 'package:budget_app/pages/widgets/transfer_money.dart';
import 'package:budget_app/pages/your_balance_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../json/activity_json.dart';
import '../theme/colors.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 350,
            child: Stack(
              children: [appBarCurve(), appBarBalance()],
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          getActivity(),
          const SizedBox(
            height: 35,
          ),
          getVerification(),
          const SizedBox(
            height: 35,
          ),
          getNewsAndPromo(),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget appBarCurve() {
    var size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        width: size.width,
        height: size.height * 0.25,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [primary, secondary]),
            boxShadow: [
              BoxShadow(
                color: bgColor.withOpacity(0.1),
                spreadRadius: 10,
                blurRadius: 10,
                // changes position of shadow
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
          child: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => YourBalancePage()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "\$",
                            style: TextStyle(fontSize: 22, color: white),
                          ),
                          Text(
                            "2,552",
                            style: TextStyle(fontSize: 30, color: white),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Available balance",
                        style: TextStyle(color: white.withOpacity(0.8)),
                      )
                    ],
                  ),
                ),
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1581803118522-7b72a50f7e9f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
                    ),
                    Positioned(
                      top: 35,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            color: white,
                            shape: BoxShape.circle,
                            border: Border.all(color: primary)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appBarBalance() {
    var size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          height: 200,
          width: size.width,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 10,
                  // changes position of shadow
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.redAccent),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Spent",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: black.withOpacity(0.5)),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                "\$1,460",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: primary),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Earned",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: black.withOpacity(0.5)),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                "\$9,850",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "You spent \$1,460 on dining out this month. Let's try to make it lower",
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Tell me more ",
                  style: TextStyle(
                      color: primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getActivity() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Activity",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15,
          ),
          Wrap(
            spacing: 25,
            children: List.generate(items.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const TransferMoney()));
                },
                child: Container(
                  width: (size.width / 3) - 30,
                  height: (size.width / 3) - 25,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: black.withOpacity(0.01),
                        spreadRadius: 10,
                        blurRadius: 10,
                        // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [primary, secondary]),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Icon(
                            items[index]['icon'],
                            color: white,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        items[index]['title'],
                        style: TextStyle(
                            fontSize: 13, color: black.withOpacity(0.5)),
                      )
                    ],
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  Widget getVerification() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Complete verification",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: size.width,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 10,
                  // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "27%",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "4 of 10 completed",
                        style: TextStyle(
                            fontSize: 13, color: black.withOpacity(0.5)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: black.withOpacity(0.04)),
                      ),
                      Container(
                        width: size.width * 0.5,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                              colors: [primary, secondary]),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        MaterialCommunityIcons.account,
                        color: primary,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Personal information",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "When you register for an account.",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "we collect peronal information",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Continue",
                            style: TextStyle(
                                color: primary,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Icon(
                        MaterialCommunityIcons.account_badge,
                        color: primary,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Verification",
                        style: TextStyle(
                          color: black,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Icon(
                        MaterialCommunityIcons.email,
                        color: primary,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Confirm email",
                        style: TextStyle(
                          color: black,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getNewsAndPromo() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "News and promo",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: size.width,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 130,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/promo_news.png"),
                          fit: BoxFit.cover),
                      // color: primary,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Share and invite your friends",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Invite friends to register on our app. For every user you invite, you will earn up to \$20.",
                        style: TextStyle(fontSize: 14, height: 1.6),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Invite Now",
                        style: TextStyle(
                            color: primary,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
