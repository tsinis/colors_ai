[![Google Play Store](https://img.shields.io/endpoint?color=green&logo=google-play&logoColor=green&url=https%3A%2F%2Fplayshields.herokuapp.com%2Fplay%3Fi%3Dis.tsin.colors_ai.colors_ai%26l%3DStore%26m%3D%24version)](https://play.google.com/store/apps/details?id=is.tsin.colors_ai.colors_ai)
[![colors-ai](https://snapcraft.io/colors-ai/badge.svg)](https://snapcraft.io/colors-ai)
[![Releases](https://img.shields.io/github/v/release/tsinis/colors_ai)](https://github.com/tsinis/colors_ai/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

[![Colors AI](https://i.vimeocdn.com/video/1049456981-b3f2133bc275235f854e021459179310ece0265a7fcb8669bbf0ef6542ae9247-d_1920x1080)](https://vimeo.com/tsinis/colors-ai)

[<img src="https://upload.wikimedia.org/wikipedia/commons/7/78/Google_Play_Store_badge_EN.svg" width="190" alt="Get it on Google Play">](https://play.google.com/store/apps/details?id=is.tsin.colors_ai.colors_ai)
[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/colors-ai)
[<img src="https://upload.wikimedia.org/wikipedia/commons/f/f7/Get_it_from_Microsoft_Badge.svg" width="155" alt="Get it from Microsoft">](https://www.microsoft.com/store/apps/9NJVF29FV74V)

Or download signed binaries for those and other platforms (such as **macOS** or **iOS**) in the [Releases](https://github.com/tsinis/colors_ai/releases) section of this GitHub repository.

# Colors AI 🤖

## Table of content

* [Description](#Description)
* [Technical Data](#Technical-Data)
  * [Architecture](#Architecture)
  * [Directory Structure](#Directory-Structure)
  * [Tests](#Tests)
  * [Packages](#Packages)
* [How to run it](#How-to-run-it)
* [UI/UX Design](#UI/UX-Design)
* [To-Do Section](#To-Do-Section)
* [Licenses](#Licenses)
* [Attributions](#Attributions)

## Description

Colors AI is a multiplatform color scheme generator that uses **deep learning from Colormind API**. Application is made with Flutter and available for Android, Windows, Linux, macOS and iOS platforms.

## Technical Data

### Architecture

![Architecture](https://uploads.toptal.io/blog/image/127604/toptal-blog-image-1543392877448-c9419df15f27b73c01c86e21cc7c5c9c.png)
App is made with a reactive style **BLoC pattern**, in four-layered architecture. User **events are passed to Blocs**, which are **processing inputs to repositories and waiting** (async mostly, since we are fetching, parsing data from REST API) **for their response from the data layer**. After that **Blocs mapping the states according to repository response**. Data layers are not linked to Flutter itself, they are abstracted from the framework and using pure Dart dependencies only. Also, no dependency injectors are used in this app either.

### Directory Structure

The application uses a **feature-driven** directory structure. This project structure allows to scale the project by having self-contained features.

### Tests

Application is **partially covered with Unit, Widget, and Integration tests**. More to come in the future.

### How to run it

Flutter version **2.6.0** or higher is assumed to be installed. Please run this command from the project's folder, in your terminal:

```bash
flutter run
```

## UI/UX Design

All animations here are made with pure Flutter. The application's UI is designed with "gesture-first" UX on mobile platforms and strictly following [Material Design Guidelines](https://material.io/design). Neutral grey color UI is used here to not disrupt user's color perception with highly contrasting light or dark themes.

## To-Do Section

* [ ] Write more tests.
* [x] Separate data layer more.
* [x] Create more interfaces for Data and Repository layers.
* [x] Add exports to PDF and PNG.
* [x] L10N.
* [ ] Add Feedback.
* [ ] Map BLoC events to state via Freezed.
* [ ] Provide support for Favorites backup (online?).

## Licenses

This project is released under the terms of the [MIT license](./LICENSE). All assets (as sounds, fonts) licensed and are free for personal use. You can find **LICENSE** files in their folders.

## Attributions

The following is a list of sound assets used in this application and their proper attribution.

["Material Product Sounds"](https://material.io/design/sound/sound-resources.html) by [Google](https://about.google) is licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/legalcode)

Assets Used:

* notification_high-intensity.wav
* notification_simple-02.wav
* ui_lock.wav
* ui_refresh-feed.wav


> Android, Google Play and the Google Play logo are trademarks of Google LLC.
