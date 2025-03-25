class SimpleImageSliderData {
  String? planName;
  String? style;
  int? height;
  String? backgroundColor;
  List<SimpleImageSlider>? simpleImageSlider;
  bool? autoSlides;

  SimpleImageSliderData(
      {this.planName,
      this.style,
      this.height,
      this.backgroundColor,
      this.simpleImageSlider,
      this.autoSlides});

  SimpleImageSliderData.fromJson(Map<String, dynamic> json) {
    planName = json['plan'];
    style = json['style'];
    height = json['height'];
    backgroundColor = json['background_color'];
    if (json['ImageSlider'] != null) {
      simpleImageSlider = <SimpleImageSlider>[];
      json['ImageSlider'].forEach((v) {
        simpleImageSlider!.add(new SimpleImageSlider.fromJson(v));
      });
    }
    autoSlides = json['autoSlides'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.planName;
    data['style'] = this.style;
    data['height'] = this.height;
    data['background_color'] = this.backgroundColor;
    if (this.simpleImageSlider != null) {
      data['ImageSlider'] =
          this.simpleImageSlider!.map((v) => v.toJson()).toList();
    }
    data['autoSlides'] = this.autoSlides;
    return data;
  }
}

class SimpleImageSlider {
  String? imageSrc;
  String? videoLink;
  String? type;
  bool? autoPlay;
  bool? loop;
  String? action;
  String? id;
  String? productTitle;

  SimpleImageSlider(
      {this.imageSrc,
      this.videoLink,
      this.type,
      this.autoPlay,
      this.loop,
      this.action,
      this.id,
      this.productTitle});

  SimpleImageSlider.fromJson(Map<String, dynamic> json) {
    imageSrc = json['ImageSrc'];
    type = json['type'];
    videoLink = json['videoLink'];
    autoPlay = json['autoPlay'];
    loop = json['loop'];
    action = json['Action'];
    id = json['id'];
    productTitle = json['productTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ImageSrc'] = this.imageSrc;
    data['videoLink'] = this.videoLink;
    data['type'] = this.type;
    data['autoPlay'] = this.autoPlay;
    data['loop'] = this.loop;
    data['Action'] = this.action;
    data['id'] = this.id;
    data['productTitle'] = this.productTitle;
    return data;
  }
}
