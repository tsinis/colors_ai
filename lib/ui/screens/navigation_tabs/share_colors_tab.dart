import 'package:colors_ai/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class ShareColors extends StatelessWidget {
  const ShareColors();
  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.all(24), child: Text('Share as File')),
            RadioListTile<FileFormat>(
              title: const Text('JPG Picture'),
              secondary: const Icon(Icons.image_outlined),
              value: FileFormat.jpg,
              groupValue: _character,
              onChanged: print,
            ),
            RadioListTile<FileFormat>(
              title: const Text('PDF Document'),
              secondary: const Icon(Mdi.filePdfBoxOutline),
              value: FileFormat.pdf,
              groupValue: _character,
              onChanged: print,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: ElevatedButton.icon(
                  style: appTheme.elevatedButtonTheme.style,
                  icon: const Icon(Icons.description_outlined, size: 20),
                  label: const Text('SHARE FILE'),
                  // autofocus: true,
                  onPressed: () {
                    print('sharing file');
                  },
                ),
              ),
            ),
            const Divider(),
            const Padding(padding: EdgeInsets.all(24), child: Text('Share as URL')),
          ],
        ),
      );
}

enum FileFormat { jpg, pdf }

FileFormat _character = FileFormat.jpg;
