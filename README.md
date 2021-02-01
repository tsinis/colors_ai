# Colors AI 🎨

## Table of content

* [Description](#Description)
* [Technical Data](#Technical-Data)
* [How to run it](#How-to-run-it)
* [UI/UX Design](#UI/UX-Design)
* [To-Do Section](#To-Do-Section)
* [Licenses](#Licenses)
* [Attributions](#Attributions)
* [Releases](#Releases)

[![Colors AI](https://i.vimeocdn.com/video/1049456981_3840x2160.jpg)](https://vimeo.com/tsinis/colors-ai)
You can watch a **preview video of it (with main functionality highlight) here:**

[Vimeo](https://vimeo.com/tsinis/colors-ai) or [YouTube](https://youtu.be/LU8RPnkDuq8)

## Description

Colors AI is a gesture-first color scheme generator that uses **deep learning from Colormind API**. Application is made with Flutter and available for Android devices.

## Technical Data

![Architecture](https://uploads.toptal.io/blog/image/127604/toptal-blog-image-1543392877448-c9419df15f27b73c01c86e21cc7c5c9c.png)
App is made with a reactive style **BLoC pattern**, in four-layered architecture. User **events are passed to Blocs**, which are **processing inputs to repositories and waiting** (async mostly, since we are fetching, parsing data from REST API) **for their response from the data layer**. After that **Blocs mapping the states according to repository response**. Data layers are not linked to Flutter itself, they are abstracted from the framework and using pure Dart dependencies only. Also, no dependency injectors are used in this app either.

Application is **partially covered with Unit, Widget, and Integration tests**. More to come in the future.

All Dart code is linted with [Pedantic](https://pub.dev/packages/pedantic). Hive with custom Color TypeAdapter is used here for local data storage. HTTP package is used for network requests to Colormind API.

**Application is null-safety ready**, there is only one dependency missing to be fully "sound" null safe ATM.

### How to run it

Flutter version **1.23** or higher is assumed to be installed. Please run this command from the project's folder, in your terminal:

```bash
flutter run --no-sound-null-safety
```

## UI/UX Design

All animations here are made with pure Flutter. The application's UI is designed with "gesture-first" UX and strictly following [Material Design Guidelines](https://material.io/design). Neutral grey color UI is used here to not disrupt user's color perception with highly contrasting light or dark themes.

## To-Do Section

* [ ] Write more tests.
* [ ] Separate data layer more.
* [ ] Create more interfaces for Data and Repository layers.
* [ ] Add dependencies list in README.
* [ ] Add exports to PDF and JPG.
* [ ] L10N.

## Licenses

This project is released under the terms of the [MIT license](./LICENSE). All assets (as sounds) are CC licensed and are free for personal use. You can find **LICENSE** files in their folders.

## Attributions

The following is a list of sound assets used in this application and their proper attribution.

["Material Product Sounds"](https://material.io/design/sound/sound-resources.html) by [Google](https://about.google) is licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/legalcode)

Assets Used:

* notification_decorative-01.ogg
* notification_decorative-02.ogg
* notification_high-intensity.ogg
* notification_simple-01.ogg
* notification_simple-02.ogg
* ui_lock.ogg
* ui_refresh-feed.ogg

## Releases

You can find signed binaries for the Android platform in the [Releases](https://github.com/tsinis/colors_ai/releases) section of this GitHub repository.
