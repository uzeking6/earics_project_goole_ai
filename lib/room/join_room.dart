import 'package:flutter/material.dart';

class JoinRoom extends StatefulWidget {
  const JoinRoom({Key? key}) : super(key: key);

  @override
  State<JoinRoom> createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {
  int selectedOption = 0; // 0 - New Meeting, 1 - Join Meeting

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Meet Lite'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => selectedOption = 0),
                  child: const Text('New Meeting'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedOption == 0 ? Colors.blue : Colors.grey,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => selectedOption = 1),
                  child: const Text('Join Meeting'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedOption == 1 ? Colors.blue : Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            if (selectedOption == 0)
              buildNewMeetingForm()
            else
              buildJoinMeetingForm(),
          ],
        ),
      ),
    );
  }

  Widget buildNewMeetingForm() {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Meeting Name',
          ),
        ),
        const SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: () => print('Create Meeting'),
          child: const Text('Start Meeting'),
        ),
      ],
    );
  }

  Widget buildJoinMeetingForm() {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Meeting Code',
          ),
        ),
        const SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: () => print('Join Meeting'),
          child: const Text('Join Meeting'),
        ),
      ],
    );
  }
}
