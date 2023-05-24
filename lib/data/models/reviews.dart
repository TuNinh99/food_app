class Review {
  final String userName;
  final String avatar;
  final String dateReviewing;
  final String comment;
  final double rating;

  Review({
    required this.userName,
    required this.avatar,
    required this.dateReviewing,
    required this.comment,
    required this.rating,
  });
}

List<Review> reivews = [
  Review(
    userName: 'Alyce Lambo',
    avatar: 'assets/images/users_avatar/user1.png',
    dateReviewing: '25/06/2020',
    comment:
        'Really convenient and the points system helps benefit loyalty. Some mild glitches here and there, but nothing too egregious. Obviously needs to roll out to more remote.',
    rating: 5,
  ),
  Review(
    userName: 'Gonela Solom',
    avatar: 'assets/images/users_avatar/user2.png',
    dateReviewing: '22/06/2020',
    comment:
        'Been a life saver for keeping our sanity during the pandemic, although they could improve some of their ui and how they handle specials as it often is unclear how to use them or everything is sold out so fast it feels a bit bait and switch. Still I\'d be stir crazy and losing track of days without so...',
    rating: 4.5,
  ),
  Review(
    userName: 'Brian C',
    avatar: 'assets/images/users_avatar/user3.png',
    dateReviewing: '21/06/2020',
    comment:
        'Got an intro offer of 50% off first order that did not work..... I have scaled the app to find a contact us button but only a spend with us button available.',
    rating: 2.5,
  ),
  Review(
    userName: 'Helsmar E',
    avatar: 'assets/images/users_avatar/user4.png',
    dateReviewing: '20/06/2020',
    comment:
        'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis. Amet minim mollit non deserunt ullamco est sit.',
    rating: 3.5,
  ),
];
