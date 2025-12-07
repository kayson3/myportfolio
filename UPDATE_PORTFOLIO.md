# Portfolio Update Instructions

## Adding Your Profile Picture

1. Place your profile picture in the `assets/images/` folder
2. Name it `profile.jpg` (or update the path in `lib/models/portfolio_data.dart`)
3. Supported formats: `.jpg`, `.png`, `.webp`
4. Recommended size: 800x1000px or similar portrait aspect ratio

## Updating Your CV Information

Edit the file `lib/models/portfolio_data.dart` and update the following sections:

### 1. Personal Information
- `name`: Your full name
- `title`: Your professional title (e.g., "Flutter Developer", "Software Engineer")
- `bio`: A brief professional bio (2-3 sentences)
- `email`: Your email address
- `location`: Your location (e.g., "Lagos, Nigeria")

### 2. Social Links
Update your social media profiles:
- `github`: Your GitHub profile URL
- `linkedin`: Your LinkedIn profile URL
- `twitter`: Your Twitter/X profile URL

### 3. Skills
Update the skills array with your actual skills and proficiency levels (0-100):
```dart
Skill(name: 'Flutter', level: 90, icon: '🎯'),
```

### 4. Experience
Add your work experience with:
- Job title
- Company name
- Duration (e.g., "2022 - Present")
- Description
- Key achievements (list)

### 5. Education
Add your educational background:
- Degree name
- Institution name
- Duration
- Description

### 6. Projects
Add your projects with:
- Project name
- Description
- Technologies used (list)
- GitHub URL
- Demo URL (if available)

## After Making Changes

1. Run `flutter pub get` to ensure dependencies are up to date
2. Run `flutter run -d chrome` to test your portfolio locally
3. For web deployment, use `flutter build web`

## Need Help?

Refer to your CV at: https://docs.google.com/document/d/1YmGSQQpcamDBPz189wH0tWnhO-NgC6KkBjfbXUwMCis/edit?usp=drive_link

