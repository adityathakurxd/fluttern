class Post {
  const Post({
    required this.company,
    required this.type,
    required this.stipend,
    required this.email,
    required this.link,
  });

  final String company;
  final String type;
  final String stipend;
  final String email;
  final String link;

  factory Post.fromGsheets(Map<String, dynamic> json) {
    return Post(
      company: json['Company Name'] ?? '',
      type: json['Type'],
      stipend: json['Stipend'] ?? '',
      email: json['Email'] ?? '',
      link: json['Job Description Link'] ?? '',
    );
  }

  //For int -> int.tryParse(json['Stipend'] ?? '') ?? 0

  Map<String, dynamic> toGsheets() {
    return {
      'Company Name': company,
      'Type': type,
      'Stipend': stipend,
      'Email': email,
      'Job Description Link': link
    };
  }
}