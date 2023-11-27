import 'package:codium/core/constants/style.dart';
import 'package:codium/core/storage/token_storage.dart';
import 'package:codium/core/widgets/skeleton.dart';
import 'package:codium/features/home/bloc/home_bloc.dart';
import 'package:codium/repositories/home/abstract_home_repository.dart';
import 'package:codium/repositories/models/user_data_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: non_constant_identifier_names
  final _HomeBloc = HomeBloc(
    GetIt.I<AbstractHomeRepository>(),
  );

  @override
  void initState() {
    _HomeBloc.add(LoadHome());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double progressBarWidth = (MediaQuery.of(context).size.width / 2) - 72;
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
      body: BlocBuilder<HomeBloc, HomeState>(
          bloc: _HomeBloc,
          builder: (context, state) {
            if (state is HomeLoading) {
              return Shimmer.fromColors(
                baseColor: CustomColors.darkAccentColor.withOpacity(0.04),
                highlightColor: CustomColors.placeHolderText,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width / 2.29,
                                    child: const Skeleton(
                                      height: 40,
                                      width: 100,
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 100,
                                  height: 30,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: CustomColors.darkAccentColor
                                          .withOpacity(0.04),
                                      borderRadius: BorderRadius.circular(24)),
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
                                          color: CustomColors.darkAccentColor
                                              .withOpacity(0.04),
                                        ),
                                        PieChartSectionData(
                                          value: 50,
                                          showTitle: false,
                                          color: CustomColors.darkAccentColor
                                              .withOpacity(0.04),
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
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Skeleton(
                                            height: 50,
                                            width: 55,
                                          ),
                                          Skeleton(
                                            height: 25,
                                            width: 20,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Skeleton(
                                        height: 20,
                                        width: 80,
                                      ),
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
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            childAspectRatio: 1,
                            crossAxisSpacing: 24,
                            mainAxisSpacing: 24,
                          ),
                          shrinkWrap: true,
                          itemCount: 6,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Material(
                              color: CustomColors.darkAccentColor
                                  .withOpacity(0.04),
                              borderRadius: BorderRadius.circular(23),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(23),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(23),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 13,
                                            width: progressBarWidth,
                                            decoration: BoxDecoration(
                                              color: CustomColors
                                                  .darkAccentColor
                                                  .withOpacity(0.04),
                                              borderRadius:
                                                  BorderRadius.circular(23),
                                            ),
                                          ),
                                          Container(
                                            height: 13,
                                            width: (progressBarWidth / 10) * 4,
                                            decoration: BoxDecoration(
                                              color: CustomColors
                                                  .darkAccentColor
                                                  .withOpacity(0.04),
                                              borderRadius:
                                                  BorderRadius.circular(23),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      const Skeleton(
                                        width: 100,
                                        height: 10,
                                      ),
                                      const Skeleton(
                                        width: 30,
                                        height: 10,
                                      ),
                                      Align(
                                          alignment: Alignment.bottomRight,
                                          child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: CustomColors
                                                .darkAccentColor
                                                .withOpacity(0.04),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is HomeSuccess) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width / 2.29,
                                child: Text(
                                  state.group?.subject?.title ?? "",
                                  style: AppFonts.s48W400.copyWith(
                                    color: CustomColors.primaryTextColor,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 35, vertical: 5),
                                decoration: BoxDecoration(
                                    color: CustomColors.accentSecondary,
                                    borderRadius: BorderRadius.circular(24)),
                                child: Center(
                                  child: Text(
                                    state.group?.title.toString() ?? "",
                                    style: AppFonts.s20W500.copyWith(
                                        color: CustomColors.primaryColor),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '50',
                                          style: AppFonts.s48W400.copyWith(
                                            color:
                                                CustomColors.primaryTextColor,
                                            height: 0,
                                          ),
                                        ),
                                        Text("%",
                                            style: AppFonts.s24W500.copyWith(
                                                color: CustomColors
                                                    .primaryTextColor))
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
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                          childAspectRatio: 1,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 24,
                        ),
                        shrinkWrap: true,
                        itemCount: state.sections?.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Material(
                            color: CustomColors.accentColor,
                            borderRadius: BorderRadius.circular(23),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/topics',
                                    arguments: {
                                      'sectionId': state.sections?[index].id,
                                      'sectionTitle':
                                          state.sections?[index].title
                                    });
                              },
                              borderRadius: BorderRadius.circular(23),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(23),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 13,
                                          width: progressBarWidth,
                                          decoration: BoxDecoration(
                                            color: CustomColors.darkAccentColor,
                                            borderRadius:
                                                BorderRadius.circular(23),
                                          ),
                                        ),
                                        Container(
                                          height: 13,
                                          width: (progressBarWidth / 10) * 4,
                                          decoration: BoxDecoration(
                                            color: CustomColors.accentSecondary,
                                            borderRadius:
                                                BorderRadius.circular(23),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      state.sections?[index].title ?? '',
                                      style: AppFonts.s24W500.copyWith(
                                          color:
                                              CustomColors.secondaryTextColor,
                                          fontSize: 16),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "1/4",
                                      style: AppFonts.s13W500.copyWith(
                                          color: CustomColors.placeHolderText),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: CircleAvatar(
                                          radius: 20,
                                          backgroundColor:
                                              CustomColors.darkAccentColor,
                                          child: Text(
                                            (index + 1).toString(),
                                            style: AppFonts.s20W500.copyWith(
                                              color: CustomColors
                                                  .secondaryTextColor,
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              );
            } else if (state is HomeFailure) {
              return Text(
                "error ${state.error}",
                style: const TextStyle(color: Colors.white),
              );
            } else {
              return const Center(
                child: Text(
                  "Ой, произошла ошибка",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
          }),
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
