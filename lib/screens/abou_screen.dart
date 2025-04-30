import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  // State variables
  bool checkboxValue1 = false;
  bool checkboxValue2 = true;
  bool switchValue = false;
  int radioValue = 0;
  double sliderValue = 0.5;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  final TextEditingController _textController = TextEditingController(
    text: "Theme testing",
  );

  // List of mock data items for list demonstrations
  final List<Map<String, dynamic>> _items = List.generate(
    5,
    (index) => {
      "title": "Item ${index + 1}",
      "subtitle": "Description for item ${index + 1}",
      "isExpanded": false,
    },
  );

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Theme and screen size utilities
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("About Theme"),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              _showInfoDialog(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Information Section
            SizedBox(height: 16.h),

            // Text Styles Section
            _buildSectionTitle(context, "Text Styles"),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Display Large", style: theme.textTheme.displayLarge),
                    Text(
                      "Display Medium",
                      style: theme.textTheme.displayMedium,
                    ),
                    Text("Display Small", style: theme.textTheme.displaySmall),
                    SizedBox(height: 8.h),
                    Text(
                      "Headline Large",
                      style: theme.textTheme.headlineLarge,
                    ),
                    Text(
                      "Headline Medium",
                      style: theme.textTheme.headlineMedium,
                    ),
                    Text(
                      "Headline Small",
                      style: theme.textTheme.headlineSmall,
                    ),
                    SizedBox(height: 8.h),
                    Text("Title Large", style: theme.textTheme.titleLarge),
                    Text("Title Medium", style: theme.textTheme.titleMedium),
                    Text("Title Small", style: theme.textTheme.titleSmall),
                    SizedBox(height: 8.h),
                    Text("Body Large", style: theme.textTheme.bodyLarge),
                    Text("Body Medium", style: theme.textTheme.bodyMedium),
                    Text("Body Small", style: theme.textTheme.bodySmall),
                    SizedBox(height: 8.h),
                    Text("Label Large", style: theme.textTheme.labelLarge),
                    Text("Label Medium", style: theme.textTheme.labelMedium),
                    Text("Label Small", style: theme.textTheme.labelSmall),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // Button Section
            _buildSectionTitle(context, "Buttons"),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _showSimpleDialog(context);
                      },
                      child: const Text("Elevated Button - Show Dialog"),
                    ),
                    SizedBox(height: 8.h),
                    FilledButton(
                      onPressed: () {
                        _showCustomDialog(context);
                      },
                      child: const Text("Filled Button - Custom Dialog"),
                    ),
                    SizedBox(height: 8.h),
                    OutlinedButton(
                      onPressed: () {
                        _showDatePicker(context);
                      },
                      child: const Text("Outlined Button - Date Picker"),
                    ),
                    SizedBox(height: 8.h),
                    TextButton(
                      onPressed: () {
                        _showTimePicker(context);
                      },
                      child: const Text("Text Button - Time Picker"),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text("Icon button pressed"),
                                action: SnackBarAction(
                                  label: 'Dismiss',
                                  onPressed: () {},
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.thumb_up),
                        ),
                        FloatingActionButton.small(
                          onPressed: () {},
                          heroTag: 'uniqueTag2',
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // Form Elements Section
            _buildSectionTitle(context, "Form Elements"),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        labelText: "Text Field",
                        hintText: "Enter some text",
                        prefixIcon: Icon(Icons.edit),
                        suffixIcon: Icon(Icons.clear),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Checkbox(
                          value: checkboxValue1,
                          onChanged: (value) {
                            setState(() {
                              checkboxValue1 = value ?? false;
                            });
                          },
                        ),
                        Text("Checkbox 1", style: theme.textTheme.bodyMedium),
                        SizedBox(width: 16.w),
                        Checkbox(
                          value: checkboxValue2,
                          onChanged: (value) {
                            setState(() {
                              checkboxValue2 = value ?? false;
                            });
                          },
                        ),
                        Text("Checkbox 2", style: theme.textTheme.bodyMedium),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Radio<int>(
                          value: 0,
                          groupValue: radioValue,
                          onChanged: (value) {
                            setState(() {
                              radioValue = value ?? 0;
                            });
                          },
                        ),
                        Text("Option 1", style: theme.textTheme.bodyMedium),
                        SizedBox(width: 16.w),
                        Radio<int>(
                          value: 1,
                          groupValue: radioValue,
                          onChanged: (value) {
                            setState(() {
                              radioValue = value ?? 1;
                            });
                          },
                        ),
                        Text("Option 2", style: theme.textTheme.bodyMedium),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Toggle Switch",
                          style: theme.textTheme.bodyMedium,
                        ),
                        Switch(
                          value: switchValue,
                          onChanged: (value) {
                            setState(() {
                              switchValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Slider: ${(sliderValue * 100).toInt()}%",
                      style: theme.textTheme.bodyMedium,
                    ),
                    Slider(
                      value: sliderValue,
                      onChanged: (value) {
                        setState(() {
                          sliderValue = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // Expansion Panel and List Tiles Section
            _buildSectionTitle(context, "Lists & Panels"),
            Card(
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  children: [
                    ExpansionPanelList(
                      elevation: 1,
                      expandedHeaderPadding: EdgeInsets.all(8.h),
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _items[index]["isExpanded"] = !isExpanded;
                        });
                      },
                      children:
                          _items.map<ExpansionPanel>((item) {
                            return ExpansionPanel(
                              headerBuilder: (context, isExpanded) {
                                return ListTile(
                                  leading: Icon(
                                    Icons.info,
                                    color: colorScheme.primary,
                                  ),
                                  title: Text(
                                    item["title"],
                                    style: theme.textTheme.titleMedium,
                                  ),
                                );
                              },
                              body: Padding(
                                padding: EdgeInsets.only(
                                  bottom: 16.h,
                                  left: 16.w,
                                  right: 16.w,
                                ),
                                child: Text(
                                  "This is expanded content for ${item["title"]}. Here you can see how the theme handles expanded panels and content within them.",
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ),
                              isExpanded: item["isExpanded"],
                            );
                          }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // List Tiles Section
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person, color: colorScheme.primary),
                    title: Text(
                      "Regular List Tile",
                      style: theme.textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      "With leading icon and trailing action",
                      style: theme.textTheme.bodySmall,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
                    onTap: () {},
                  ),
                  const Divider(),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: colorScheme.primaryContainer,
                      child: Text(
                        "AB",
                        style: TextStyle(color: colorScheme.onPrimaryContainer),
                      ),
                    ),
                    title: Text(
                      "List Tile with Avatar",
                      style: theme.textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      "And a longer description text that might wrap to more than one line",
                      style: theme.textTheme.bodySmall,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                    onTap: () {},
                  ),
                  const Divider(),
                  SwitchListTile(
                    title: Text(
                      "Switch List Tile",
                      style: theme.textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      "Control with integrated switch",
                      style: theme.textTheme.bodySmall,
                    ),
                    value: switchValue,
                    onChanged: (value) {
                      setState(() {
                        switchValue = value;
                      });
                    },
                    secondary: Icon(
                      Icons.lightbulb_outline,
                      color:
                          switchValue
                              ? colorScheme.primary
                              : colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const Divider(),
                  CheckboxListTile(
                    title: Text(
                      "Checkbox List Tile",
                      style: theme.textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      "Control with integrated checkbox",
                      style: theme.textTheme.bodySmall,
                    ),
                    value: checkboxValue1,
                    onChanged: (value) {
                      setState(() {
                        checkboxValue1 = value ?? false;
                      });
                    },
                    secondary: Icon(
                      Icons.check_circle_outline,
                      color:
                          checkboxValue1
                              ? colorScheme.primary
                              : colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // Chips Section
            _buildSectionTitle(context, "Chips"),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: [
                    Chip(
                      label: const Text("Basic Chip"),
                      avatar: Icon(Icons.tag, size: 16.sp),
                    ),
                    Chip(
                      label: const Text("Deletable"),
                      deleteIcon: const Icon(Icons.cancel),
                      onDeleted: () {},
                    ),
                    ActionChip(
                      label: const Text("Action"),
                      avatar: Icon(Icons.play_arrow, size: 16.sp),
                      onPressed: () {},
                    ),
                    FilterChip(
                      label: const Text("Filter"),
                      selected: checkboxValue2,
                      onSelected: (value) {
                        setState(() {
                          checkboxValue2 = value;
                        });
                      },
                    ),
                    InputChip(
                      label: const Text("Input"),
                      avatar: Icon(Icons.person, size: 16.sp),
                      deleteIcon: const Icon(Icons.close),
                      onDeleted: () {},
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // Bottom buttons
            Center(
              child: Column(
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.construction),
                    label: const Text("Show Bottom Sheet"),
                    onPressed: () {
                      _showBottomSheet(context);
                    },
                  ),
                  SizedBox(height: 8.h),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.warning_amber),
                    label: const Text("Show Banner"),
                    onPressed: () {
                      _showBanner(context);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Show a message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("This is a floating action button!"),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        heroTag: 'uniqueTag1',
        icon: const Icon(Icons.star),
        label: const Text("Theme Test"),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Container(
            width: 4.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      helpText: "SELECT A DATE",
      confirmText: "CONFIRM",
      cancelText: "CANCEL",
      fieldLabelText: "Enter Date",
      fieldHintText: "Month/Date/Year",
      errorFormatText: "Invalid format",
      errorInvalidText: "Out of range",
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      // Show confirmation
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Date selected: ${picked.toLocal().toString().split(' ')[0]}",
            ),
          ),
        );
      }
    }
  }

  Future<void> _showTimePicker(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      helpText: "SELECT TIME",
      cancelText: "CANCEL",
      confirmText: "CONFIRM",
      hourLabelText: "Hour",
      minuteLabelText: "Minute",
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
      // Show confirmation
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Time selected: ${picked.format(context)}")),
        );
      }
    }
  }

  Future<void> _showSimpleDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Simple Dialog"),
          content: const Text(
            "This is a simple dialog to demonstrate the dialog theme settings in your application.",
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showCustomDialog(BuildContext context) async {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 32.r,
                  backgroundColor: colorScheme.primaryContainer,
                  child: Icon(
                    Icons.star,
                    size: 40.sp,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
                SizedBox(height: 16.h),
                Text("Custom Dialog", style: theme.textTheme.headlineSmall),
                SizedBox(height: 8.h),
                Text(
                  "This dialog demonstrates custom styling while still inheriting from your theme settings.",
                  style: theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton.icon(
                      icon: const Icon(Icons.close),
                      label: const Text("Cancel"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.check),
                      label: const Text("Confirm"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showInfoDialog(BuildContext context) async {
    final theme = Theme.of(context);

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.info, color: theme.colorScheme.primary),
              SizedBox(width: 8.w),
              const Text("About This Demo"),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "This screen demonstrates the theme configuration for your Flutter application.",
                  style: theme.textTheme.bodyLarge,
                ),
                SizedBox(height: 8.h),
                Text(
                  "It includes various UI components to help you visualize and test your theme settings across different elements.",
                  style: theme.textTheme.bodyMedium,
                ),
                SizedBox(height: 8.h),
                Text(
                  "Try interacting with different elements to see how they respond.",
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("Got It"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showBottomSheet(BuildContext context) {
    final theme = Theme.of(context);

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Bottom Sheet", style: theme.textTheme.headlineSmall),
              SizedBox(height: 16.h),
              Text(
                "This is a modal bottom sheet. It's useful for displaying additional options or information without navigating away from the current screen.",
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      icon: const Icon(Icons.check_circle),
                      label: const Text("Primary Action"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Center(
                child: TextButton(
                  child: const Text("Close"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showBanner(BuildContext context) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: const Text(
          "This is a material banner. It can be used to display important messages that require user attention.",
        ),
        leading: Icon(
          Icons.announcement,
          color: Theme.of(context).colorScheme.error,
        ),
        actions: [
          TextButton(
            child: const Text("DISMISS"),
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
          ),
          TextButton(
            child: const Text("ACTION"),
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              // Show an action confirmation
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Banner action triggered")),
              );
            },
          ),
        ],
      ),
    );
  }
}
