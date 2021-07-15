class Proffesions {
  List<Content>? content;
  bool? empty;
  bool? first;
  bool? last;
  int? number;
  int? numberOfElements;
  Pageable? pageable;
  int? size;
  Sort? sort;
  int? totalElements;
  int? totalPages;

  Proffesions(
      {this.content,
      this.empty,
      this.first,
      this.last,
      this.number,
      this.numberOfElements,
      this.pageable,
      this.size,
      this.sort,
      this.totalElements,
      this.totalPages});

  Proffesions.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
    empty = json['empty'];
    first = json['first'];
    last = json['last'];
    number = json['number'];
    numberOfElements = json['numberOfElements'];
    pageable = json['pageable'] != null
        ? new Pageable.fromJson(json['pageable'])
        : null;
    size = json['size'];
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    data['empty'] = this.empty;
    data['first'] = this.first;
    data['last'] = this.last;
    data['number'] = this.number;
    data['numberOfElements'] = this.numberOfElements;
    if (this.pageable != null) {
      data['pageable'] = this.pageable!.toJson();
    }
    data['size'] = this.size;
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    data['totalElements'] = this.totalElements;
    data['totalPages'] = this.totalPages;
    return data;
  }
}

class Content {
  String? id;
  String? name;

  Content({this.id, this.name});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Pageable {
  int? offset;
  int? pageNumber;
  int? pageSize;
  bool? paged;
  Sort? sort;
  bool? unpaged;

  Pageable(
      {this.offset,
      this.pageNumber,
      this.pageSize,
      this.paged,
      this.sort,
      this.unpaged});

  Pageable.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    paged = json['paged'];
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    data['paged'] = this.paged;
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    data['unpaged'] = this.unpaged;
    return data;
  }
}

class Sort {
  bool? empty;
  bool? sorted;
  bool? unsorted;

  Sort({this.empty, this.sorted, this.unsorted});

  Sort.fromJson(Map<String, dynamic> json) {
    empty = json['empty'];
    sorted = json['sorted'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['empty'] = this.empty;
    data['sorted'] = this.sorted;
    data['unsorted'] = this.unsorted;
    return data;
  }
}
