import 'package:flutter/material.dart';
import 'StoryBrain.dart';

void main() => runApp(MaterialApp(
      home: StoryPage(),
    ));

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int storyNumber = 0;
  storyBrain storybrain = new storyBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.png'), fit: BoxFit.cover)),
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storybrain.getStory(storyNumber),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    //Choice 1 made by user.
                    setState(() {
                      storyNumber = storybrain.nextStory(1, storyNumber);
                    });
                  },
                  color: Colors.red,
                  child: Text(
                    storybrain.getChoice1(storyNumber),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible:
                      storybrain.getChoice2(storyNumber) == '' ? false : true,
                  child: FlatButton(
                    onPressed: () {
                      //Choice 2 made by user.
                      setState(() {
                        storyNumber = storybrain.nextStory(2, storyNumber);
                      });
                    },
                    color: Colors.blue,
                    child: Text(
                      storybrain.getChoice2(storyNumber),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
