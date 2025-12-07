# Icon and Favicon Replacement Guide

This guide will help you replace the default Flutter icons with your custom portfolio icons.

## Required Icon Sizes

### Web Icons
- **favicon.png**: 32x32 or 64x64 pixels (PNG format)
- **Icon-192.png**: 192x192 pixels (PNG format)
- **Icon-512.png**: 512x512 pixels (PNG format)
- **Icon-maskable-192.png**: 192x192 pixels (PNG format, maskable)
- **Icon-maskable-512.png**: 512x512 pixels (PNG format, maskable)

### Android Icons
Place in `android/app/src/main/res/`:
- **mipmap-mdpi/ic_launcher.png**: 48x48 pixels
- **mipmap-hdpi/ic_launcher.png**: 72x72 pixels
- **mipmap-xhdpi/ic_launcher.png**: 96x96 pixels
- **mipmap-xxhdpi/ic_launcher.png**: 144x144 pixels
- **mipmap-xxxhdpi/ic_launcher.png**: 192x192 pixels

### iOS Icons
Place in `ios/Runner/Assets.xcassets/AppIcon.appiconset/`:
- **Icon-App-20x20@1x.png**: 20x20 pixels
- **Icon-App-20x20@2x.png**: 40x40 pixels
- **Icon-App-20x20@3x.png**: 60x60 pixels
- **Icon-App-29x29@1x.png**: 29x29 pixels
- **Icon-App-29x29@2x.png**: 58x58 pixels
- **Icon-App-29x29@3x.png**: 87x87 pixels
- **Icon-App-40x40@1x.png**: 40x40 pixels
- **Icon-App-40x40@2x.png**: 80x80 pixels
- **Icon-App-40x40@3x.png**: 120x120 pixels
- **Icon-App-60x60@2x.png**: 120x120 pixels
- **Icon-App-60x60@3x.png**: 180x180 pixels
- **Icon-App-76x76@1x.png**: 76x76 pixels
- **Icon-App-76x76@2x.png**: 152x152 pixels
- **Icon-App-83.5x83.5@2x.png**: 167x167 pixels
- **Icon-App-1024x1024@1x.png**: 1024x1024 pixels (Required for App Store)

### macOS Icons
Place in `macos/Runner/Assets.xcassets/AppIcon.appiconset/`:
- **app_icon_16.png**: 16x16 pixels
- **app_icon_32.png**: 32x32 pixels
- **app_icon_64.png**: 64x64 pixels
- **app_icon_128.png**: 128x128 pixels
- **app_icon_256.png**: 256x256 pixels
- **app_icon_512.png**: 512x512 pixels
- **app_icon_1024.png**: 1024x1024 pixels

### Windows Icons
Place in `windows/runner/resources/`:
- **app_icon.ico**: Multi-resolution ICO file (16x16, 32x32, 48x48, 256x256)

## Quick Steps to Replace Icons

### Option 1: Using Online Icon Generator (Recommended)
1. Create a single high-resolution icon (1024x1024 pixels) with your logo/initials
2. Use an online tool like:
   - [AppIcon.co](https://www.appicon.co/)
   - [IconKitchen](https://icon.kitchen/)
   - [Favicon.io](https://favicon.io/) (for web favicons)
3. Upload your icon and download all required sizes
4. Replace the files in the respective directories

### Option 2: Manual Replacement
1. Create your icon design (recommended: 1024x1024 pixels)
2. Use image editing software (Photoshop, GIMP, Figma) to resize to each required size
3. Replace files in the directories listed above

### Option 3: Using Flutter Package
You can use the `flutter_launcher_icons` package:
1. Add to `pubspec.yaml`:
```yaml
dev_dependencies:
  flutter_launcher_icons: ^0.13.1

flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/icon/icon.png"  # Your 1024x1024 icon
  adaptive_icon_background: "#6366F1"  # Your primary color
  adaptive_icon_foreground: "assets/icon/icon_foreground.png"
```

2. Run: `flutter pub get && flutter pub run flutter_launcher_icons`

## Web Favicon Quick Replace

For web favicon only:
1. Create a 32x32 or 64x64 PNG image
2. Replace `web/favicon.png` with your image
3. The favicon will automatically update

## Design Tips

- Use your initials (SI) or a simple logo
- Ensure good contrast for visibility
- Test on both light and dark backgrounds
- Keep the design simple and recognizable at small sizes
- Use your brand colors (Indigo #6366F1, Purple #8B5CF6)

## Verification

After replacing icons:
- **Web**: Clear browser cache and reload
- **Android**: Rebuild the app (`flutter build apk` or `flutter run`)
- **iOS**: Clean build folder in Xcode and rebuild
- **macOS**: Clean build folder in Xcode and rebuild
- **Windows**: Rebuild the app

## Notes

- All icons should be PNG format (except Windows .ico)
- Maintain aspect ratio (square icons)
- Use transparent backgrounds where appropriate
- For maskable icons (Android), ensure important content is within the safe zone (80% of the icon)
