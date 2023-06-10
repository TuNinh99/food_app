import 'package:flutter/material.dart';
import 'package:food_app/data/models/reviews.dart';
import 'package:food_app/utils/themes.dart';
import 'package:food_app/widgets/header_bar.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: HeaderBar(
        size: size,
        pageName: 'Reviews',
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.0775),
        child: ListView(
          children: [
            const _WriteReviews(),
            const SizedBox(
              height: 35,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: reivews.length,
              itemBuilder: (context, index) {
                return _ReviewItem(
                  size: size,
                  review: reivews[index],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class _ReviewItem extends StatelessWidget {
  const _ReviewItem({
    required this.size,
    required this.review,
  });

  final Size size;
  final Review review;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      constraints: const BoxConstraints(
        // maxHeight: size.height * 0.3,
        maxHeight: 180,
      ),
      margin: const EdgeInsets.only(
        bottom: 30,
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomRight,
                    children: [
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: Image.asset(
                          review.avatar,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        left: 40,
                        bottom: 5,
                        child: Container(
                          width: 18.5,
                          height: 18.5,
                          decoration: const BoxDecoration(
                            color: kColorYellow,
                            borderRadius: BorderRadius.all(
                              Radius.circular(6),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 7),
                                blurRadius: 14,
                                color: Color.fromRGBO(255, 197, 41, 0.5),
                              )
                            ],
                          ),
                          child: Center(
                            child: Text(
                              review.rating.toStringAsFixed(1),
                              style: PrimaryFont.medium(8.5).copyWith(
                                color: kColorWhite,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.userName,
                        style: PrimaryFont.medium(15).copyWith(
                          color: kColorBlack,
                          height: 1,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        review.dateReviewing,
                        style: PrimaryFont.medium(13).copyWith(
                          color: const Color(0XFFB3B3B3),
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
                FittedBox(
                  child: Column(
                    children: [
                      Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(2),
                            ),
                            color: Color(0XFFC4C4C4)),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          color: Color(0XFFC4C4C4),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Text(
            review.comment,
            style: PrimaryFont.light(15).copyWith(
              color: const Color(0XFF7F7D92),
              height: 1.4,
            ),
          )
        ],
      ),
    );
  }
}

class _WriteReviews extends StatelessWidget {
  const _WriteReviews();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 51,
      child: TextFormField(
        maxLines: null,
        expands: true,
        cursorColor: kColorYellow,
        decoration: InputDecoration(
          hintText: 'Write your review...',
          contentPadding: const EdgeInsets.only(
            left: 100,
            top: 10,
            bottom: 10,
          ),
          prefixIcon: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: Image.asset(
                'assets/images/avatar.png',
                width: 30,
                height: 30,
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 1,
              style: BorderStyle.solid,
              color: Color(0XFFEEEEEE),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: kColorPrimary,
            ),
          ),
        ),
        style: PrimaryFont.medium(17).copyWith(
          color: const Color(0XFF111719),
          height: 1,
        ),
      ),
    );
  }
}
