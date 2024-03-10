import 'package:assignment/model/user.dart';
import 'package:assignment/model/user_provider.dart';
import 'package:assignment/views/register/done_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeekSelection extends StatefulWidget {
  const WeekSelection({super.key});

  @override
  State<WeekSelection> createState() => _WeekSelectionState();
}

class _WeekSelectionState extends State<WeekSelection> {
  Map<String, List<String>> businessHours = {
    'M': [],
    'T': [],
    'W': [],
    'Th': [],
    'F': [],
    'S': [],
    'Su': [],
  };
  Map<String, bool> timings = {
    '8:00 AM - 10:00 AM': false,
    '10:00 AM - 1:00 PM': false,
    '1:00 PM - 4:00 PM': false,
    '4:00 PM - 7:00 PM': false,
    '7:00 PM - 10:00 PM': false,
  };
  List<String> selectedDays = List.empty(growable: true);
  String selectedDay = 'M';

  void myOnPress() {}
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            'M',
            'T',
            'W',
            'Th',
            'F',
            'S',
            'Su',
          ]
              .map(
                (String item) => InkWell(
                  onTap: () => setState(() {
                    selectedDay = item;
                    if (businessHours[selectedDay]!.isEmpty) {
                      for (var key in timings.keys) {
                        timings[key] = false;
                      }
                    } else {
                      for (var key in timings.keys) {
                        if (businessHours[selectedDay]!.contains(key)) {
                          timings[key] = true;
                        } else {
                          timings[key] = false;
                        }
                      }
                    }
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedDay == item
                          ? const Color(0xffD5715B)
                          : (businessHours[item]!.isEmpty
                              ? Colors.white
                              : Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(item),
                  ),
                ),
              )
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyCustomTimeButton(timings.keys.elementAt(0),
                (timings.values.elementAt(0) ? const Color(0xffF8C569) : null),
                () {
              setState(() {
                timings[timings.keys.elementAt(0)] =
                    !timings.values.elementAt(0);
                if (timings.values.elementAt(0)) {
                  businessHours[selectedDay]!.add(timings.keys.elementAt(0));
                } else {
                  businessHours[selectedDay]!.remove(timings.keys.elementAt(0));
                }
              });
            }),
            MyCustomTimeButton(timings.keys.elementAt(1),
                (timings.values.elementAt(1) ? const Color(0xffF8C569) : null),
                () {
              setState(() {
                timings[timings.keys.elementAt(1)] =
                    !timings.values.elementAt(1);
                if (timings.values.elementAt(1)) {
                  businessHours[selectedDay]!.add(timings.keys.elementAt(1));
                } else {
                  businessHours[selectedDay]!.remove(timings.keys.elementAt(1));
                }
              });
            }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyCustomTimeButton(timings.keys.elementAt(2),
                (timings.values.elementAt(2) ? const Color(0xffF8C569) : null),
                () {
              setState(() {
                timings[timings.keys.elementAt(2)] =
                    !timings.values.elementAt(2);
                if (timings.values.elementAt(2)) {
                  businessHours[selectedDay]!.add(timings.keys.elementAt(2));
                } else {
                  businessHours[selectedDay]!.remove(timings.keys.elementAt(2));
                }
              });
            }),
            MyCustomTimeButton(timings.keys.elementAt(3),
                (timings.values.elementAt(3) ? const Color(0xffF8C569) : null),
                () {
              setState(() {
                timings[timings.keys.elementAt(3)] =
                    !timings.values.elementAt(3);
                if (timings.values.elementAt(3)) {
                  businessHours[selectedDay]!.add(timings.keys.elementAt(3));
                } else {
                  businessHours[selectedDay]!.remove(timings.keys.elementAt(3));
                }
              });
            }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyCustomTimeButton(timings.keys.elementAt(4),
                (timings.values.elementAt(4) ? const Color(0xffF8C569) : null),
                () {
              setState(() {
                timings[timings.keys.elementAt(4)] =
                    !timings.values.elementAt(4);
                if (timings.values.elementAt(4)) {
                  businessHours[selectedDay]!.add(timings.keys.elementAt(4));
                } else {
                  businessHours[selectedDay]!.remove(timings.keys.elementAt(4));
                }
              });
            }),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.31,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                User oldUser =
                    Provider.of<UserDataProvider>(context, listen: false).user;
                oldUser.bussinessHours = businessHours;
                Provider.of<UserDataProvider>(context, listen: false).user =
                    oldUser;
                Provider.of<UserDataProvider>(context, listen: false)
                    .printUser();
                Provider.of<UserDataProvider>(context, listen: false)
                    .register();
                Navigator.pushNamed(context, DoneView.doneView);
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Color(0xffD5715B),
                ),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: const Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class MyCustomTimeButton extends StatelessWidget {
  String time = '';
  Color color = Colors.grey.shade300;
  late Function onPressed;

  MyCustomTimeButton(time, color, onPressed) {
    this.time = time;
    this.color = color ?? this.color;
    this.onPressed = onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => onPressed(),
        child: Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              time,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
