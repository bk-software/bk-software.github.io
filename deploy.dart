import 'dart:io';
import 'dart:convert';

void main() async {
  // Get the list of changed files
  var result = await Process.run('git', ['status', '--short']);
  if (result.exitCode != 0) {
    print('Error getting status: ${result.stderr}');
    exit(1);
  }

  var changedFiles = result.stdout.trim();
  if (changedFiles.isEmpty) {
    print('No changes to deploy.');
    exit(0);
  }

  print('Changed files:\n$changedFiles');
  stdout.write('Do you want to commit these changes? (yes/no): ');
  var approval = stdin.readLineSync()?.toLowerCase();

  if (approval != 'yes') {
    print('Deployment aborted.');
    exit(0);
  }

  // Add the changes
  result = await Process.run('git', ['add', '.']);
  if (result.exitCode != 0) {
    print('Error adding changes: ${result.stderr}');
    exit(1);
  }

  // Get the commit message
  stdout.write('Enter commit message (default: "Update site"): ');
  var commitMessage = stdin.readLineSync();
  if (commitMessage == null || commitMessage.isEmpty) {
    commitMessage = 'Update site';
  }

  // Commit the changes
  result = await Process.run('git', ['commit', '-m', commitMessage]);
  if (result.exitCode != 0) {
    print('Error committing changes: ${result.stderr}');
    exit(1);
  }

  // Push the changes
  result = await Process.run('git', ['push']);
  if (result.exitCode != 0) {
    print('Error pushing changes: ${result.stderr}');
    exit(1);
  }

  // Open the site in the default browser

  var siteUrl = 'https://bk-software.github.io/';

  if (Platform.isMacOS) {
    await Process.run('open', [siteUrl]);
  } else if (Platform.isWindows) {
    await Process.run('explorer', [siteUrl]);
  } else if (Platform.isLinux) {
    await Process.run('xdg-open', [siteUrl]);
  } else {
    print('Cannot open browser on this platform. Please visit $siteUrl manually.');
  }

  print('Deployment completed successfully.');
}

