// To parse this JSON data, do
//
//     final unSplashModel = unSplashModelFromJson(jsonString);

import 'dart:convert';

List<UnSplashModel> unSplashModelFromJson(String str) => List<UnSplashModel>.from(json.decode(str).map((x) => UnSplashModel.fromJson(x)));

String unSplashModelToJson(List<UnSplashModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UnSplashModel {
    dynamic id;
    dynamic slug;
    AlternativeSlugs alternativeSlugs;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic promotedAt;
    int width;
    int height;
    dynamic color;
    dynamic blurHash;
    dynamic description;
    dynamic altDescription;
    List<dynamic> breadcrumbs;
    Urls urls;
    UnSplashModelLinks links;
    int likes;
    bool likedByUser;
    List<dynamic> currentUserCollections;
    Sponsorship? sponsorship;
    TopicSubmissions topicSubmissions;
    AssetType assetType;
    User user;

    UnSplashModel({
        required this.id,
        required this.slug,
        required this.alternativeSlugs,
        required this.createdAt,
        required this.updatedAt,
        required this.promotedAt,
        required this.width,
        required this.height,
        required this.color,
        required this.blurHash,
        required this.description,
        required this.altDescription,
        required this.breadcrumbs,
        required this.urls,
        required this.links,
        required this.likes,
        required this.likedByUser,
        required this.currentUserCollections,
        required this.sponsorship,
        required this.topicSubmissions,
        required this.assetType,
        required this.user,
    });

    factory UnSplashModel.fromJson(Map<String, dynamic> json) {
      print(json["id"]);
      print;(json["slug"]);
      print(DateTime.parse(json["created_at"]));
      print(DateTime.parse(json["updated_at"]));
      print(json["promoted_at"]);
      print(json["width"]);
      print(json["height"]);
      print(json["color"]);
      print(json["blur_hash"]);
      print(json["description"]);
      print( json["alt_description"]);
      print(json["likes"]);
      print(json["liked_by_user"]);
      print(json["user"]);
      return UnSplashModel(
        id: json["id"],
        slug: json["slug"],
        alternativeSlugs: AlternativeSlugs.fromJson(json["alternative_slugs"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        promotedAt: json["promoted_at"],
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        breadcrumbs: List<dynamic>.from(json["breadcrumbs"].map((x) => x)),
        urls: Urls.fromJson(json["urls"]),
        links: UnSplashModelLinks.fromJson(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        sponsorship: json["sponsorship"] == null ? null : Sponsorship.fromJson(json["sponsorship"]),
        topicSubmissions: TopicSubmissions.fromJson(json["topic_submissions"]),
        assetType: assetTypeValues.map[json["asset_type"]]!,
        user: User.fromJson(json["user"]),
    );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "alternative_slugs": alternativeSlugs.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "promoted_at": promotedAt,
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "breadcrumbs": List<dynamic>.from(breadcrumbs.map((x) => x)),
        "urls": urls.toJson(),
        "links": links.toJson(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
        "sponsorship": sponsorship?.toJson(),
        "topic_submissions": topicSubmissions.toJson(),
        "asset_type": assetTypeValues.reverse[assetType],
        "user": user.toJson(),
    };
}

class AlternativeSlugs {
    dynamic en;
    dynamic es;
    dynamic ja;
    dynamic fr;
    dynamic it;
    dynamic ko;
    dynamic de;
    dynamic pt;

    AlternativeSlugs({
        required this.en,
        required this.es,
        required this.ja,
        required this.fr,
        required this.it,
        required this.ko,
        required this.de,
        required this.pt,
    });

    factory AlternativeSlugs.fromJson(Map<String, dynamic> json) => AlternativeSlugs(
        en: json["en"],
        es: json["es"],
        ja: json["ja"],
        fr: json["fr"],
        it: json["it"],
        ko: json["ko"],
        de: json["de"],
        pt: json["pt"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "es": es,
        "ja": ja,
        "fr": fr,
        "it": it,
        "ko": ko,
        "de": de,
        "pt": pt,
    };
}

enum AssetType {
    PHOTO
}

final assetTypeValues = EnumValues({
    "photo": AssetType.PHOTO
});

class UnSplashModelLinks {
    dynamic self;
    dynamic html;
    dynamic download;
    dynamic downloadLocation;

    UnSplashModelLinks({
        required this.self,
        required this.html,
        required this.download,
        required this.downloadLocation,
    });

    factory UnSplashModelLinks.fromJson(Map<String, dynamic> json) => UnSplashModelLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
    };
}

class Sponsorship {
    List<dynamic> impressionUrls;
    dynamic tagline;
    dynamic taglineUrl;
    User sponsor;

    Sponsorship({
        required this.impressionUrls,
        required this.tagline,
        required this.taglineUrl,
        required this.sponsor,
    });

    factory Sponsorship.fromJson(Map<String, dynamic> json) => Sponsorship(
        impressionUrls: List<String>.from(json["impression_urls"].map((x) => x)),
        tagline: json["tagline"],
        taglineUrl: json["tagline_url"],
        sponsor: User.fromJson(json["sponsor"]),
    );

    Map<String, dynamic> toJson() => {
        "impression_urls": List<dynamic>.from(impressionUrls.map((x) => x)),
        "tagline": tagline,
        "tagline_url": taglineUrl,
        "sponsor": sponsor.toJson(),
    };
}

class User {
    dynamic id;
    DateTime updatedAt;
    dynamic username;
    dynamic name;
    dynamic firstName;
    dynamic lastName;
    dynamic? twitterUsername;
    dynamic? portfolioUrl;
    dynamic bio;
    dynamic? location;
    UserLinks links;
    ProfileImage profileImage;
    dynamic? instagramUsername;
    int totalCollections;
    int totalLikes;
    int totalPhotos;
    int totalPromotedPhotos;
    int totalIllustrations;
    int totalPromotedIllustrations;
    bool acceptedTos;
    bool forHire;
    Social social;

    User({
        required this.id,
        required this.updatedAt,
        required this.username,
        required this.name,
        required this.firstName,
        required this.lastName,
        required this.twitterUsername,
        required this.portfolioUrl,
        required this.bio,
        required this.location,
        required this.links,
        required this.profileImage,
        required this.instagramUsername,
        required this.totalCollections,
        required this.totalLikes,
        required this.totalPhotos,
        required this.totalPromotedPhotos,
        required this.totalIllustrations,
        required this.totalPromotedIllustrations,
        required this.acceptedTos,
        required this.forHire,
        required this.social,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        twitterUsername: json["twitter_username"],
        portfolioUrl: json["portfolio_url"],
        bio: json["bio"],
        location: json["location"],
        links: UserLinks.fromJson(json["links"]),
        profileImage: ProfileImage.fromJson(json["profile_image"]),
        instagramUsername: json["instagram_username"],
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
        totalPromotedPhotos: json["total_promoted_photos"],
        totalIllustrations: json["total_illustrations"],
        totalPromotedIllustrations: json["total_promoted_illustrations"],
        acceptedTos: json["accepted_tos"],
        forHire: json["for_hire"],
        social: Social.fromJson(json["social"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "updated_at": updatedAt.toIso8601String(),
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "twitter_username": twitterUsername,
        "portfolio_url": portfolioUrl,
        "bio": bio,
        "location": location,
        "links": links.toJson(),
        "profile_image": profileImage.toJson(),
        "instagram_username": instagramUsername,
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
        "total_promoted_photos": totalPromotedPhotos,
        "total_illustrations": totalIllustrations,
        "total_promoted_illustrations": totalPromotedIllustrations,
        "accepted_tos": acceptedTos,
        "for_hire": forHire,
        "social": social.toJson(),
    };
}

class UserLinks {
    dynamic self;
    dynamic html;
    dynamic photos;
    dynamic likes;
    dynamic portfolio;
    dynamic following;
    dynamic followers;

    UserLinks({
        required this.self,
        required this.html,
        required this.photos,
        required this.likes,
        required this.portfolio,
        required this.following,
        required this.followers,
    });

    factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
        portfolio: json["portfolio"],
        following: json["following"],
        followers: json["followers"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
        "portfolio": portfolio,
        "following": following,
        "followers": followers,
    };
}

class ProfileImage {
    dynamic small;
    dynamic medium;
    dynamic large;

    ProfileImage({
        required this.small,
        required this.medium,
        required this.large,
    });

    factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
    );

    Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
    };
}

class Social {
    dynamic? instagramUsername;
    dynamic? portfolioUrl;
    dynamic? twitterUsername;
    dynamic paypalEmail;

    Social({
        required this.instagramUsername,
        required this.portfolioUrl,
        required this.twitterUsername,
        required this.paypalEmail,
    });

    factory Social.fromJson(Map<String, dynamic> json) => Social(
        instagramUsername: json["instagram_username"],
        portfolioUrl: json["portfolio_url"],
        twitterUsername: json["twitter_username"],
        paypalEmail: json["paypal_email"],
    );

    Map<String, dynamic> toJson() => {
        "instagram_username": instagramUsername,
        "portfolio_url": portfolioUrl,
        "twitter_username": twitterUsername,
        "paypal_email": paypalEmail,
    };
}

class TopicSubmissions {
    Nature? people;
    Nature? nature;
    Animals? animals;

    TopicSubmissions({
        this.people,
        this.nature,
        this.animals,
    });

    factory TopicSubmissions.fromJson(Map<String, dynamic> json) => TopicSubmissions(
        people: json["people"] == null ? null : Nature.fromJson(json["people"]),
        nature: json["nature"] == null ? null : Nature.fromJson(json["nature"]),
        animals: json["animals"] == null ? null : Animals.fromJson(json["animals"]),
    );

    Map<String, dynamic> toJson() => {
        "people": people?.toJson(),
        "nature": nature?.toJson(),
        "animals": animals?.toJson(),
    };
}

class Animals {
    dynamic status;
    DateTime approvedOn;

    Animals({
        required this.status,
        required this.approvedOn,
    });

    factory Animals.fromJson(Map<String, dynamic> json) => Animals(
        status: json["status"],
        approvedOn: DateTime.parse(json["approved_on"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "approved_on": approvedOn.toIso8601String(),
    };
}

class Nature {
    dynamic status;

    Nature({
        required this.status,
    });

    factory Nature.fromJson(Map<String, dynamic> json) => Nature(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}

class Urls {
    dynamic raw;
    dynamic full;
    dynamic regular;
    dynamic small;
    dynamic thumb;
    dynamic smallS3;

    Urls({
        required this.raw,
        required this.full,
        required this.regular,
        required this.small,
        required this.thumb,
        required this.smallS3,
    });

    factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
        smallS3: json["small_s3"],
    );

    Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
        "small_s3": smallS3,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
