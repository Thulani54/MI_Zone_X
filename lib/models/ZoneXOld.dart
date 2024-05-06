class JournalDetails {
  String appUserId;
  String journalId;
  String journalTitle;
  String journalEntry;
  String journalImage;
  bool favorite;

  JournalDetails({
    required this.appUserId,
    required this.journalId,
    required this.journalTitle,
    required this.journalEntry,
    required this.journalImage,
    required this.favorite,
  });
}

class CreateMemorial {
  String appUserId;
  String createdBy;
  bool isPublished;
  String id;

  CreateMemorial({
    required this.appUserId,
    required this.createdBy,
    required this.isPublished,
    required this.id,
  });
}

class BioDetails {
  String memorialId;
  String id;
  String appUserId;
  String profileImage;
  String bioHeadline;
  String bioDescription;
  String dateOfBirth;
  String dateOfDeath;
  String firstName;
  String secondName;
  String lastName;

  BioDetails({
    required this.memorialId,
    required this.id,
    required this.appUserId,
    required this.profileImage,
    required this.bioHeadline,
    required this.bioDescription,
    required this.dateOfBirth,
    required this.dateOfDeath,
    required this.firstName,
    required this.secondName,
    required this.lastName,
  });
}

class Tributes {
  String id;
  String memorialId;
  String message;
  String firstName;
  String lastName;

  Tributes({
    required this.id,
    required this.memorialId,
    required this.message,
    required this.firstName,
    required this.lastName,
  });
}

class LifeDetails {
  String memorialId;
  String id;
  String appUserId;
  String title;
  String story;

  LifeDetails({
    required this.memorialId,
    required this.id,
    required this.appUserId,
    required this.title,
    required this.story,
  });
}

class LifeStoryContributors {
  String lifeId;
  String id;
  String firstName;
  String lastName;
  String relationship;

  LifeStoryContributors({
    required this.lifeId,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.relationship,
  });
}

class StoryDetails {
  String appUserId;
  String memorialId;
  String id;
  String title;
  String story;
  String fromAge;
  String toAge;
  bool isFavorite;

  StoryDetails({
    required this.appUserId,
    required this.memorialId,
    required this.id,
    required this.title,
    required this.story,
    required this.fromAge,
    required this.toAge,
    required this.isFavorite,
  });

  Map<String, dynamic> toJson() {
    return {
      'appUserId': appUserId,
      'memorialId': memorialId,
      'id': id,
      'title': title,
      'story': story,
      'fromAge': fromAge,
      'toAge': toAge,
      'isFavorite': isFavorite,
    };
  }
}

class FuneralDetails {
  String id;
  String firstName;
  String lastName;
  String dateOfBirth;
  String dateOfDeath;
  String headline;
  String obituary;
  String obituaryAuthor;
  String acknowledgementMessage;
  String acknowledgementAuthor;
  String appUserId;
  bool isShared;
  String streetNo;
  String streetName;
  String suburb;
  String city;
  String province;
  String postalCode;

  FuneralDetails({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.dateOfDeath,
    required this.headline,
    required this.obituary,
    required this.obituaryAuthor,
    required this.acknowledgementMessage,
    required this.acknowledgementAuthor,
    required this.appUserId,
    required this.isShared,
    required this.streetNo,
    required this.streetName,
    required this.suburb,
    required this.city,
    required this.province,
    required this.postalCode,
  });
}

class AddNewFriends {
  String appUserId;
  String friend;
  bool isFollowing;

  AddNewFriends({
    required this.appUserId,
    required this.friend,
    required this.isFollowing,
  });
}

class FamilyTree {
  String id;
  String relatedToId;
  String appUserId;
  String relationshipType;
  String firstName;
  String lastName;
  String gender;
  String maritalStatus;
  String dateOfDeath;
  String dateOfBirth;
  bool isHead;
  String title;
  String idNumber;
  String treeTitle;
  String familyMemberId;

  FamilyTree({
    required this.id,
    required this.relatedToId,
    required this.appUserId,
    required this.relationshipType,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.maritalStatus,
    required this.dateOfDeath,
    required this.dateOfBirth,
    required this.isHead,
    required this.title,
    required this.idNumber,
    required this.treeTitle,
    required this.familyMemberId,
  });
}

class TreeLabels {
  String id;
  String treeName;
  String appUserId;

  TreeLabels({
    required this.id,
    required this.treeName,
    required this.appUserId,
  });
}

class MiLegendsDetails {
  String appUserId;
  String id;
  String firstName;
  String lastName;
  String contactNumber;
  String emailAddress;
  String communityName;
  String communityDuration;
  String problemSolved;
  String province;
  String legendBio;
  String legendLife;
  String legendImpact;
  String municipality;
  String localCommunity;

  MiLegendsDetails({
    required this.appUserId,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.contactNumber,
    required this.emailAddress,
    required this.communityName,
    required this.communityDuration,
    required this.problemSolved,
    required this.province,
    required this.legendBio,
    required this.legendLife,
    required this.legendImpact,
    required this.municipality,
    required this.localCommunity,
  });
}

class MessagesToLegends {
  String id;
  String legendId;
  String message;
  String appUserId;

  MessagesToLegends({
    required this.id,
    required this.legendId,
    required this.message,
    required this.appUserId,
  });
}

class LegendVotingPoll {
  String id;
  String legendId;
  String appUserId;

  LegendVotingPoll({
    required this.id,
    required this.legendId,
    required this.appUserId,
  });
}

class FamilyTotem {
  String id;
  String appUserId;
  String slogan;

  FamilyTotem({
    required this.id,
    required this.appUserId,
    required this.slogan,
  });
}

class VideoReaction {
  String videoId;
  String appUserId;
  bool liked;

  VideoReaction({
    required this.videoId,
    required this.appUserId,
    required this.liked,
  });
}

class OrderDetails {
  String id;
  String user;
  String fullName;
  String phone;
  String status;
  String orderCode;
  String paymentMethod;
  String taxPrice;
  String shippingPrice;
  String totalPrice;
  String usedCoupon;
  String isPaid;
  String paidAt;
  String isDelivered;
  String deliveredAt;
  String address;
  List<dynamic> products;
  List<dynamic> productsName;
  List<dynamic> quantity;
  List<dynamic> price;
  List<dynamic> selectedAttributes;

  OrderDetails({
    required this.id,
    required this.user,
    required this.fullName,
    required this.phone,
    required this.status,
    required this.orderCode,
    required this.paymentMethod,
    required this.taxPrice,
    required this.shippingPrice,
    required this.totalPrice,
    required this.usedCoupon,
    required this.isPaid,
    required this.paidAt,
    required this.isDelivered,
    required this.deliveredAt,
    required this.address,
    required this.products,
    required this.productsName,
    required this.quantity,
    required this.price,
    required this.selectedAttributes,
  });
}

class ReviewDetails {
  String productId;
  String appUser;
  String name;
  dynamic rating;
  String comment;
  String id;

  ReviewDetails({
    required this.productId,
    required this.appUser,
    required this.name,
    required this.rating,
    required this.comment,
    required this.id,
  });
}

class Tunes {
  String songSrc;
  String songName;
  String id;

  Tunes({
    required this.songSrc,
    required this.songName,
    required this.id,
  });
}

class ThemeSong {
  String id;
  String memoriesId;
  String songTitle;
  String song;
  String appUserId;

  ThemeSong({
    required this.id,
    required this.memoriesId,
    required this.songTitle,
    required this.song,
    required this.appUserId,
  });
}

class Category {
  String userId;
  int id;
  String title;
  String category;
  String icon;
  String path;

  Category({
    required this.userId,
    required this.id,
    required this.title,
    required this.category,
    required this.icon,
    required this.path,
  });
}

class UpdatePass {
  String email;
  dynamic otp;
  dynamic password;
  dynamic cpassword;

  UpdatePass({
    required this.email,
    required this.otp,
    required this.password,
    required this.cpassword,
  });
}
