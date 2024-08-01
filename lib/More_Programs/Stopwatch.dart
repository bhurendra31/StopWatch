import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  int myIndex = 0;
  late Timer _timer;
  int _start = 0;
  bool _isRunning = false;
  List laps = [];

  @override
  void initState() {
    super.initState();
  }

  void _startTimer() {
    if (!_isRunning) {
      _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        setState(() {
          _start++;
        });
      });
      setState(() {
        _isRunning = true;
      });
    }
  }

  void _stoptimer() {
    if (_isRunning) {
      _timer.cancel();
      setState(() {
        _isRunning = false;
      });
    }
  }

  void _resettimer() {
    _stoptimer();
    setState(() {
      _start = 0;
      laps.clear();
    });
  }

  void _recordLap() {
    String lap = _formatTime(_start);
    setState(() {
      laps.insert(0, lap);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(int milliseconds) {
    final minutes = (milliseconds ~/ 6000).toString().padLeft(2, '0');
    final seconds = ((milliseconds % 6000) ~/ 100).toString().padLeft(2, '0');
    final microseconds = (milliseconds % 100).toString().padLeft(2, '0');
    return '$minutes:$seconds:$microseconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Stopwatch',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            Icon(
              Icons.watch,
              color: Colors.white,
            )
          ],
        ),
        backgroundColor: Colors.black,
      ),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formatTime(_start),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 65,
                  fontWeight: FontWeight.bold),
            ),

            // Start Button
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isRunning ? null : _startTimer,
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(30)),
                  child: const Text('Start'),
                ),

                // Stop Button
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _isRunning ? _stoptimer : null,
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(30)),
                  child: const Text('Stop'),
                ),

                // Reset Button
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _isRunning ? null : _resettimer,
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 181, 136, 13),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(30)),
                  child: const Text('Reset'),
                ),


                // Lap Button
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _isRunning ? _recordLap : null,
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(30)),
                  child: const Text('Lap'),
                ),
              ],
            ),
            Container(
            
              height: 150,
              child: ListView.builder(
                itemCount: laps.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Container(
                      child: Row(
                        children: [
                          Text(
                            (index + 1).toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 30),
                          Text(
                            laps[index],
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

