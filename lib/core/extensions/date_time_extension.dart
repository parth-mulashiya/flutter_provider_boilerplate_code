import 'package:intl/intl.dart';

extension DateTimeFormatting on DateTime {
  String get toShortDate => DateFormat('dd-MM-yyyy').format(this);

  String get toLongDate => DateFormat('MMMM dd, yyyy').format(this);

  String get toTime => DateFormat('hh:mm a').format(this);

  String get toFullDateTime => DateFormat('dd-MM-yyyy hh:mm a').format(this);

  String get toIsoDate => DateFormat('yyyy-MM-dd').format(this);

  String get toDatabaseFormat => DateFormat('yyyy-MM-dd HH:mm:ss').format(this);

  String get toDayMonth => DateFormat('EEE, MMM d').format(this);

  String get weekdayName => DateFormat('EEEE').format(this);

  String get toReadableDateTime =>
      DateFormat('MMM d, yyyy \'at\' hh:mm a').format(this);

  String get toMonthYear => DateFormat('MMMM yyyy').format(this);

  /// Relative time: "Just now", "5 minutes ago", "Yesterday", etc.
  String get timeAgo {
    final now = DateTime.now();
    final diff = now.difference(this);

    if (diff.inSeconds < 60) return 'Just now';
    if (diff.inMinutes < 60) {
      return '${diff.inMinutes} minute${diff.inMinutes > 1 ? 's' : ''} ago';
    }
    if (diff.inHours < 24) {
      return '${diff.inHours} hour${diff.inHours > 1 ? 's' : ''} ago';
    }
    if (diff.inDays == 1) return 'Yesterday';
    if (diff.inDays < 7) {
      return '${diff.inDays} day${diff.inDays > 1 ? 's' : ''} ago';
    }
    if (diff.inDays < 30) {
      return '${(diff.inDays / 7).floor()} week${(diff.inDays / 7).floor() > 1 ? 's' : ''} ago';
    }
    if (diff.inDays < 365) {
      return '${(diff.inDays / 30).floor()} month${(diff.inDays / 30).floor() > 1 ? 's' : ''} ago';
    }

    return '${(diff.inDays / 365).floor()} year${(diff.inDays / 365).floor() > 1 ? 's' : ''} ago';
  }

  String formatWith(String pattern) => DateFormat(pattern).format(this);
}
