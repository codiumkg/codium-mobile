import 'package:codium/core/constants/style.dart';
import 'package:flutter/material.dart';

class TopicsScreen extends StatefulWidget {
  const TopicsScreen({super.key});

  @override
  State<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Условные операторы и переменные",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: CustomColors.primaryTextColor),
        ),
        iconTheme: IconThemeData(color: CustomColors.primaryTextColor),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 20,
            itemBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: CustomColors.accentColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: CustomColors.darkAccentColor,
                                child: Text(
                                  (i + 1).toString(),
                                  style: AppFonts.s20W500.copyWith(
                                    color: CustomColors.secondaryTextColor,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Topics",
                                    style: AppFonts.s24W500.copyWith(
                                        color: CustomColors.secondaryTextColor,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "4/2",
                                    style: AppFonts.s13W500.copyWith(
                                      color: CustomColors.placeHolderText,
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
                )),
      ),
    );
  }
}
