import 'package:codium/core/constants/style.dart';
import 'package:codium/core/widgets/skeleton.dart';
import 'package:codium/features/topics/bloc/topics_bloc.dart';
import 'package:codium/repositories/topics/abstract_topics_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

class TopicsScreen extends StatefulWidget {
  const TopicsScreen(
      {super.key, required this.sectionId, required this.sectionTitle});
  final int sectionId;
  final String sectionTitle;

  @override
  State<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
  // ignore: non_constant_identifier_names
  final _TopcicsBloc = TopicsBloc(
    GetIt.I<AbstractTopicsRepository>(),
  );

  @override
  void initState() {
    _TopcicsBloc.add(LoadTopics(sectionId: widget.sectionId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.sectionTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: CustomColors.primaryTextColor),
        ),
        iconTheme: IconThemeData(color: CustomColors.primaryTextColor),
        centerTitle: true,
      ),
      body: BlocBuilder<TopicsBloc, TopicsState>(
          bloc: _TopcicsBloc,
          builder: (context, state) {
            if (state is TopicsLoading) {
              return Shimmer.fromColors(
                baseColor: CustomColors.darkAccentColor.withOpacity(0.04),
                highlightColor: CustomColors.placeHolderText,
                child: Center(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 10,
                      itemBuilder: (context, i) => Padding(
                            padding: const EdgeInsets.only(
                                top: 15, left: 10, right: 10),
                            child: Material(
                              color: CustomColors.darkAccentColor
                                  .withOpacity(0.04),
                              borderRadius: BorderRadius.circular(13),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(13),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundColor:
                                                CustomColors.darkAccentColor,
                                          ),
                                          const SizedBox(
                                            width: 20,
                                            height: 20,
                                          ),
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Skeleton(
                                                width: 100,
                                                height: 20,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Skeleton(
                                                width: 40,
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: CustomColors.secondaryTextColor,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                ),
              );
            } else if (state is TopicsSuccess) {
              return Center(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: state.topics?.length,
                    itemBuilder: (context, i) => Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 10, right: 10),
                          child: Material(
                            color: CustomColors.accentColor,
                            borderRadius: BorderRadius.circular(13),
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(13),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor:
                                              CustomColors.darkAccentColor,
                                          child: Text(
                                            (i + 1).toString(),
                                            style: AppFonts.s20W500.copyWith(
                                              color: CustomColors
                                                  .secondaryTextColor,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                          height: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.topics?[i].title ?? "",
                                              style: AppFonts.s24W500.copyWith(
                                                  color: CustomColors
                                                      .secondaryTextColor,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              "4/2",
                                              style: AppFonts.s13W500.copyWith(
                                                color: CustomColors
                                                    .placeHolderText,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: CustomColors.secondaryTextColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
              );
            } else if (state is TopicsFailure) {
              const Text("SDfsdf");
            } else {
              return const CircularProgressIndicator();
            }
            return const Scaffold(
              body: Text(
                "sdfsdf",
                style: TextStyle(color: Colors.white),
              ),
            );
          }),
    );
  }
}
