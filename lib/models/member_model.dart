class Member {
  const Member({
    required this.email,
    required this.name,
    required this.language,
    required this.framework,
    required this.domain,
    required this.discordId,
    required this.isOpen,
  });

  final String email;
  final String name;
  final String language;
  final String framework;
  final String domain;
  final String discordId;
  final String isOpen;

  factory Member.fromGsheets(Map<String, dynamic> json) {
    return Member(
      email: json['Email address'] ?? '',
      name: json['Name'],
      language: json['Choose your Warrior(s)'] ?? 'No Languages mentioned',
      framework: json['Choose your Framework/SDK or whatever'] ?? 'No Frameworks selected',
      domain: json['Choose domain(s) of interest'] ?? 'Developer',
      discordId: json['Your Discord id?'] ?? '',
      isOpen: json['Are you open to Job/Internships?'] ?? '',
    );
  }

  //For int -> int.tryParse(json['Stipend'] ?? '') ?? 0
  //
  // Map<String, dynamic> toGsheets() {
  //   return {
  //     'Company Name': company,
  //     'Type': type,
  //     'Stipend': stipend,
  //     'Email': email,
  //     'Job Description Link': link
  //   };
  // }
}