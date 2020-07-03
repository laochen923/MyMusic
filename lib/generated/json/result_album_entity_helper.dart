import 'package:mymusic/main/entity/result_album_entity.dart';

resultAlbumEntityFromJson(ResultAlbumEntity data, Map<String, dynamic> json) {
	if (json['result'] != null) {
		data.result = new ResultAlbumResult().fromJson(json['result']);
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	return data;
}

Map<String, dynamic> resultAlbumEntityToJson(ResultAlbumEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	data['code'] = entity.code;
	return data;
}

resultAlbumResultFromJson(ResultAlbumResult data, Map<String, dynamic> json) {
	if (json['albums'] != null) {
		data.albums = new List<ResultAlbumResultAlbum>();
		(json['albums'] as List).forEach((v) {
			data.albums.add(new ResultAlbumResultAlbum().fromJson(v));
		});
	}
	if (json['albumCount'] != null) {
		data.albumCount = json['albumCount']?.toInt();
	}
	return data;
}

Map<String, dynamic> resultAlbumResultToJson(ResultAlbumResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.albums != null) {
		data['albums'] =  entity.albums.map((v) => v.toJson()).toList();
	}
	data['albumCount'] = entity.albumCount;
	return data;
}

resultAlbumResultAlbumFromJson(ResultAlbumResultAlbum data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['size'] != null) {
		data.size = json['size']?.toInt();
	}
	if (json['picId'] != null) {
		data.picId = json['picId']?.toInt();
	}
	if (json['blurPicUrl'] != null) {
		data.blurPicUrl = json['blurPicUrl']?.toString();
	}
	if (json['companyId'] != null) {
		data.companyId = json['companyId']?.toInt();
	}
	if (json['pic'] != null) {
		data.pic = json['pic']?.toInt();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['publishTime'] != null) {
		data.publishTime = json['publishTime']?.toInt();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['tags'] != null) {
		data.tags = json['tags']?.toString();
	}
	if (json['company'] != null) {
		data.company = json['company']?.toString();
	}
	if (json['briefDesc'] != null) {
		data.briefDesc = json['briefDesc']?.toString();
	}
	if (json['artist'] != null) {
		data.artist = new ResultAlbumResultAlbumsArtist().fromJson(json['artist']);
	}
	if (json['songs'] != null) {
		data.songs = json['songs'];
	}
	if (json['alias'] != null) {
		data.alias = new List<dynamic>();
		data.alias.addAll(json['alias']);
	}
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['copyrightId'] != null) {
		data.copyrightId = json['copyrightId']?.toInt();
	}
	if (json['commentThreadId'] != null) {
		data.commentThreadId = json['commentThreadId']?.toString();
	}
	if (json['artists'] != null) {
		data.artists = new List<ResultAlbumResultAlbumsArtist>();
		(json['artists'] as List).forEach((v) {
			data.artists.add(new ResultAlbumResultAlbumsArtist().fromJson(v));
		});
	}
	if (json['paid'] != null) {
		data.paid = json['paid'];
	}
	if (json['onSale'] != null) {
		data.onSale = json['onSale'];
	}
	if (json['picId_str'] != null) {
		data.picidStr = json['picId_str']?.toString();
	}
	if (json['alg'] != null) {
		data.alg = json['alg']?.toString();
	}
	if (json['mark'] != null) {
		data.mark = json['mark']?.toInt();
	}
	if (json['containedSong'] != null) {
		data.containedSong = json['containedSong']?.toString();
	}
	return data;
}

Map<String, dynamic> resultAlbumResultAlbumToJson(ResultAlbumResultAlbum entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['id'] = entity.id;
	data['type'] = entity.type;
	data['size'] = entity.size;
	data['picId'] = entity.picId;
	data['blurPicUrl'] = entity.blurPicUrl;
	data['companyId'] = entity.companyId;
	data['pic'] = entity.pic;
	data['picUrl'] = entity.picUrl;
	data['publishTime'] = entity.publishTime;
	data['description'] = entity.description;
	data['tags'] = entity.tags;
	data['company'] = entity.company;
	data['briefDesc'] = entity.briefDesc;
	if (entity.artist != null) {
		data['artist'] = entity.artist.toJson();
	}
	data['songs'] = entity.songs;
	if (entity.alias != null) {
		data['alias'] =  [];
	}
	data['status'] = entity.status;
	data['copyrightId'] = entity.copyrightId;
	data['commentThreadId'] = entity.commentThreadId;
	if (entity.artists != null) {
		data['artists'] =  entity.artists.map((v) => v.toJson()).toList();
	}
	data['paid'] = entity.paid;
	data['onSale'] = entity.onSale;
	data['picId_str'] = entity.picidStr;
	data['alg'] = entity.alg;
	data['mark'] = entity.mark;
	data['containedSong'] = entity.containedSong;
	return data;
}

resultAlbumResultAlbumsArtistFromJson(ResultAlbumResultAlbumsArtist data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['picId'] != null) {
		data.picId = json['picId']?.toInt();
	}
	if (json['img1v1Id'] != null) {
		data.img1v1Id = json['img1v1Id']?.toInt();
	}
	if (json['briefDesc'] != null) {
		data.briefDesc = json['briefDesc']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['img1v1Url'] != null) {
		data.img1v1Url = json['img1v1Url']?.toString();
	}
	if (json['albumSize'] != null) {
		data.albumSize = json['albumSize']?.toInt();
	}
	if (json['alias'] != null) {
		data.alias = new List<dynamic>();
		data.alias.addAll(json['alias']);
	}
	if (json['trans'] != null) {
		data.trans = json['trans']?.toString();
	}
	if (json['musicSize'] != null) {
		data.musicSize = json['musicSize']?.toInt();
	}
	if (json['topicPerson'] != null) {
		data.topicPerson = json['topicPerson']?.toInt();
	}
	if (json['picId_str'] != null) {
		data.picidStr = json['picId_str']?.toString();
	}
	if (json['img1v1Id_str'] != null) {
		data.img1v1idStr = json['img1v1Id_str']?.toString();
	}
	if (json['alia'] != null) {
		data.alia = new List<dynamic>();
		data.alia.addAll(json['alia']);
	}
	return data;
}

Map<String, dynamic> resultAlbumResultAlbumsArtistToJson(ResultAlbumResultAlbumsArtist entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['id'] = entity.id;
	data['picId'] = entity.picId;
	data['img1v1Id'] = entity.img1v1Id;
	data['briefDesc'] = entity.briefDesc;
	data['picUrl'] = entity.picUrl;
	data['img1v1Url'] = entity.img1v1Url;
	data['albumSize'] = entity.albumSize;
	if (entity.alias != null) {
		data['alias'] =  [];
	}
	data['trans'] = entity.trans;
	data['musicSize'] = entity.musicSize;
	data['topicPerson'] = entity.topicPerson;
	data['picId_str'] = entity.picidStr;
	data['img1v1Id_str'] = entity.img1v1idStr;
	if (entity.alia != null) {
		data['alia'] =  [];
	}
	return data;
}