class PortfolioData {
  // Personal Information
  static const String name = 'Samson Ibikunle';
  static const String title = 'Flutter Developer';
  static const String bio =
      'xperienced Flutter Developer specializing in building scalable mobile applications with expertise in MVVM architecture, REST APIs, Firebase, and real-time systems. Passionate about creating high-quality, performant applications with a focus on user experience and best practices.';
  static const String email = 'ayomiposiibikunle@gmail.com';
  static const String location = 'Lagos, Nigeria';

  // Profile Image - Place your profile picture in assets/images/profile.jpg
  // Supported formats: jpg, png, webp
  static const String profileImagePath = 'assets/images/profile.jpg';

  // Social Links
  static const String github = 'https://github.com/kayson3';
  static const String linkedin =
      'https://www.linkedin.com/in/samson-ibikunle-354119167/';
  static const String twitter = 'https://x.com/i_am_kayson';

  // Skills
  static const List<Skill> skills = [
    Skill(name: 'Flutter', level: 95, icon: '🎯'),
    Skill(name: 'Dart', level: 90, icon: '💙'),
    Skill(name: 'JavaScript (ES6+)', level: 85, icon: '📜'),
    Skill(name: 'REST API', level: 90, icon: '🌐'),
    Skill(name: 'Firebase', level: 85, icon: '🔥'),
    Skill(name: 'MySQL', level: 80, icon: '🗄️'),
    Skill(name: 'MongoDB', level: 80, icon: '🍃'),
    Skill(name: 'GraphQL', level: 75, icon: '📊'),
    Skill(name: 'MVVM Architecture', level: 90, icon: '🏗️'),
    Skill(name: 'CI/CD', level: 85, icon: '⚙️'),
  ];

  // Experience
  static const List<Experience> experiences = [
    Experience(
      title: 'Mobile Application Developer',
      company: 'Fuspay Technologies',
      duration: 'September 2022 - Present',
      description:
          'Developing and maintaining mobile applications for financial services, focusing on P2P transactions and payment solutions.',
      achievements: [
        'Implement new user interfaces and features',
        'Automated unit and integration testing',
        'Ensuring best performance and user experience of the application',
        'Fixing bugs and performance problems',
        'Cooperating with back-end developers, designers and the rest of the team to deliver well-architected and high-quality solutions',
      ],
    ),
    Experience(
      title: 'Mid-Level Flutter Developer',
      company: 'Goalspaces',
      duration: '2024',
      description:
          'Building goal-tracking applications with focus on UI/UX enhancement and continuous deployment systems.',
      achievements: [
        'Building out new features',
        'Improving the UI/UX to enhance user experience',
        'Driving the integration of a Flutter continuous deployment system',
        'Participating in the interview process for new hires',
        'Using product experience to contribute to the vision and direction of our product',
      ],
    ),
    Experience(
      title: 'Mobile Application Developer',
      company: 'Vertical Aspects',
      duration: 'July 2023 - October 2023',
      description:
          'Developed mobile applications with focus on user interface design and application performance optimization.',
      achievements: [
        'Develop and implement new user interfaces and features to enhance application functionality',
        'Write and maintain automated unit and integration tests to ensure code reliability',
        'Optimize application performance and user experience for smooth operation',
        'Identify, troubleshoot, and fix bugs and performance issues',
        'Collaborate with back-end developers, designers, and the rest of the team to create well-architected, high-quality solutions',
      ],
    ),
    Experience(
      title: 'Mobile Application Developer',
      company: 'Q-Project Technologies',
      duration: 'May 2022 - August 2022',
      description:
          'Designed and implemented engaging user interfaces for payment applications with focus on scalability and maintainability.',
      achievements: [
        'Design and implement engaging user interfaces with new features',
        'Ensure code quality through automated unit and integration testing',
        'Focus on performance optimization and delivering a seamless user experience',
        'Debug and resolve performance bottlenecks and software issues',
        'Work closely with back-end developers, UI/UX designers, and team members to build scalable and maintainable applications',
      ],
    ),
    Experience(
      title: 'Mobile Application Developer (Intern)',
      company: 'VigoPlace',
      duration: 'April 2022',
      description:
          'Internship focused on creating and refining user interfaces, developing automated tests, and collaborating with cross-functional teams.',
      achievements: [
        'Create and refine user interfaces and features to improve app usability',
        'Develop and execute automated unit and integration tests for system stability',
        'Ensure top-tier application performance and a smooth user experience',
        'Diagnose and resolve bugs and performance concerns efficiently',
        'Collaborate with developers, designers, and stakeholders to deliver high-quality, well-structured solutions',
      ],
    ),
    Experience(
      title: 'Mobile Application Developer (Intern)',
      company: 'TerraHQ LMS (formerly Sidehustle)',
      duration: '2021 (6 months)',
      description:
          'Completed comprehensive 6-month Flutter development course covering Dart programming, state management, UI/UX design, and API integration.',
      achievements: [
        'Completed comprehensive 6-month Flutter development course, covering the fundamentals of Dart programming, state management, UI/UX design, and API integration',
        'Developed and deployed cross-platform mobile and web applications, gaining hands-on experience with Flutter widgets, Firebase, and third-party libraries',
        'Built multiple projects to strengthen problem-solving skills and best practices in app development',
      ],
    ),
  ];

  // Education
  static const List<Education> education = [
    Education(
      degree: 'B.Eng. Electrical Electronics Engineering',
      institution: 'Federal University Oye Ekiti',
      duration: '2018 - 2025',
      description:
          'Studying Electrical Electronics Engineering with a focus on applying engineering principles to software development and mobile application architecture.',
    ),
  ];

  // Projects
  static const List<Project> projects = [
    Project(
      name: 'Intrapay',
      description:
          'With Intrapay, end users have moved away from the hassles and trust issues of P2P transactions. Our network of Exchangers allows users to transfer funds to family and friends across the globe.',
      technologies: ['Flutter', 'Firebase', 'REST API', 'Payment Integration'],
      githubUrl: 'https://github.com/kayson3',
      demoUrl:
          'https://play.google.com/store/apps/details?id=com.fuspay.intrapay',
    ),
    Project(
      name: 'Goalspaces',
      description:
          'Looking to achieve your goals, but don\'t know where to start? Then, Goalspaces is the perfect app for you! With Goalspaces, you can set, track, and achieve your personal and professional goals.',
      technologies: ['Flutter', 'Firebase', 'MVVM', 'CI/CD'],
      githubUrl: 'https://github.com/kayson3',
      demoUrl:
          'https://play.google.com/store/apps/details?id=space.mvpapp.centralspace',
    ),
    Project(
      name: 'Blacktinum',
      description:
          'Blacktinum is a versatile crypto trading software that integrates artificial intelligence algorithms with smart contracts to execute automated trading processes in real-time.',
      technologies: [
        'Flutter',
        'AI Integration',
        'Smart Contracts',
        'Real-time Systems',
      ],
      githubUrl: 'https://github.com/kayson3',
      demoUrl: 'https://testflight.apple.com/join/g95phD5P',
    ),
    Project(
      name: 'Basketeteer',
      description:
          'Basketeteer provides you with insightful and statistically backed daily basketball predictions for various leagues. We focus on delivering tips for games with a high probability of winning, giving you the edge you need to stay informed.',
      technologies: ['Flutter', 'Data Analytics', 'REST API', 'Statistics'],
      githubUrl: 'https://github.com/kayson3',
      demoUrl: 'https://testflight.apple.com/join/g95phD5P',
    ),
  ];
}

class Skill {
  final String name;
  final int level;
  final String icon;

  const Skill({required this.name, required this.level, required this.icon});
}

class Experience {
  final String title;
  final String company;
  final String duration;
  final String description;
  final List<String> achievements;

  const Experience({
    required this.title,
    required this.company,
    required this.duration,
    required this.description,
    required this.achievements,
  });
}

class Education {
  final String degree;
  final String institution;
  final String duration;
  final String description;

  const Education({
    required this.degree,
    required this.institution,
    required this.duration,
    required this.description,
  });
}

class Project {
  final String name;
  final String description;
  final List<String> technologies;
  final String githubUrl;
  final String demoUrl;

  const Project({
    required this.name,
    required this.description,
    required this.technologies,
    required this.githubUrl,
    required this.demoUrl,
  });
}
