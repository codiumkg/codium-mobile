import 'package:codium/core/constants/style.dart';
import 'package:codium/core/storage/token_storage.dart';
import 'package:codium/features/authorization/widgets/custom_text.dart';
import 'package:codium/repositories/models/user_data_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double progressBarWidth = (MediaQuery.of(context).size.width / 2) - 72;
    final List<Map> myProducts = List.generate(
        10,
        (index) => {
              "id": index,
              "name": "Типы данных и условные операторы",
              "totalTasks": "4",
              "completedTasks": "1"
            }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CODIUM",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: CustomColors.primaryTextColor),
        ),
        iconTheme: IconThemeData(color: CustomColors.primaryTextColor),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        "Python",
                        style: AppFonts.s48W400
                            .copyWith(color: CustomColors.primaryTextColor),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 5),
                        decoration: BoxDecoration(
                            color: CustomColors.accentSecondary,
                            borderRadius: BorderRadius.circular(24)),
                        child: Center(
                          child: Text(
                            "Группа - 2",
                            style: AppFonts.s20W500
                                .copyWith(color: CustomColors.primaryColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 135,
                        height: 135,
                        child: PieChart(
                          PieChartData(
                            startDegreeOffset: 270,
                            sectionsSpace: 0,
                            sections: [
                              PieChartSectionData(
                                value: 50,
                                showTitle: false,
                                color: CustomColors.accentColor,
                              ),
                              PieChartSectionData(
                                value: 50,
                                showTitle: false,
                                color: CustomColors.accentSecondary,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 120,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: CustomColors.primaryColor,
                          borderRadius: BorderRadius.circular(66),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '50',
                                  style: AppFonts.s48W400.copyWith(
                                    color: CustomColors.primaryTextColor,
                                    height: 0,
                                  ),
                                ),
                                Text("%",
                                    style: AppFonts.s24W500.copyWith(
                                        color: CustomColors.primaryTextColor))
                              ],
                            ),
                            Text(
                              "Выполнено",
                              style: AppFonts.s13W500.copyWith(
                                  color: CustomColors.primaryTextColor),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 42),
              GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 1,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                ),
                shrinkWrap: true,
                itemCount: myProducts.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: CustomColors.accentColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 13,
                              width: progressBarWidth,
                              decoration: BoxDecoration(
                                color: CustomColors.darkAccentColor,
                                borderRadius: BorderRadius.circular(23),
                              ),
                            ),
                            Container(
                              height: 13,
                              width: (progressBarWidth / 10) * 4,
                              decoration: BoxDecoration(
                                color: CustomColors.accentSecondary,
                                borderRadius: BorderRadius.circular(23),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          myProducts[index]["name"],
                          style: AppFonts.s24W500.copyWith(
                              color: CustomColors.secondaryTextColor,
                              fontSize: 16),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          myProducts[index]["totalTasks"] +
                              "/" +
                              myProducts[index]["completedTasks"],
                          style: AppFonts.s13W500
                              .copyWith(color: CustomColors.placeHolderText),
                        ),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: CustomColors.darkAccentColor,
                            )),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      drawer: FutureBuilder<UserDataModel?>(
          future: TokenStorage.getUserData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Drawer(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          DrawerHeader(
                            decoration: BoxDecoration(
                              color: CustomColors.secondaryColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: const NetworkImage(
                                        "https://w7.pngwing.com/pngs/193/660/png-transparent-computer-icons-woman-avatar-avatar-girl-thumbnail.png"),
                                    backgroundColor:
                                        CustomColors.primaryTextColor,
                                    radius: 30,
                                  ),
                                  const SizedBox(
                                    height: 134,
                                    width: 26,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('${snapshot.data?.user?.username}',
                                          textAlign: TextAlign.left,
                                          style: AppFonts.s20W500.copyWith(
                                            color:
                                                CustomColors.primaryTextColor,
                                          )),
                                      Text(
                                        '${snapshot.data?.user?.subject}',
                                        textAlign: TextAlign.end,
                                        style: AppFonts.s13W500.copyWith(
                                            color:
                                                CustomColors.primaryTextColor),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.task,
                              color: CustomColors.primaryTextColor,
                            ),
                            title: Text(
                              'Задания',
                              style: AppFonts.s20W500.copyWith(
                                  color: CustomColors.primaryTextColor),
                            ),
                            onTap: () {
                              // Ваш обработчик для элемента меню
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.settings,
                              color: CustomColors.primaryTextColor,
                            ),
                            title: Text(
                              'Настройки',
                              style: AppFonts.s20W500.copyWith(
                                  color: CustomColors.primaryTextColor),
                            ),
                            onTap: () {
                              // Ваш обработчик для элемента меню
                            },
                          ),

                          // Другие элементы меню
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.login_outlined,
                        color: CustomColors.primaryTextColor,
                      ),
                      title: Text("Выйти",
                          style: AppFonts.s20W500
                              .copyWith(color: CustomColors.primaryTextColor)),
                      onTap: () {
                        TokenStorage.clearUserData();
                        Navigator.of(context).pushReplacementNamed('/login');
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
