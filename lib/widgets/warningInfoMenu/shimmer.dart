import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Shimmer.fromColors(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 7.5),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.grey[500],
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 90,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[500],
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[500],
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ),
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(11.0),
                              child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[500],
                                      borderRadius: BorderRadius.circular(20))),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 19,
                                  height: 19,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[500],
                                      borderRadius: BorderRadius.circular(19))),
                              SizedBox(width: 10),
                              Container(
                                  width: 80,
                                  height: 15,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[500],
                                      borderRadius: BorderRadius.circular(4))),
                              SizedBox(width: 45)
                            ])
                      ],
                    ),
                  ),
                  baseColor: Colors.grey[500],
                  highlightColor: Colors.white));
        });
  }
}
