import 'package:flutter/material.dart';

void main() => runApp(FriendlyChat());

class FriendlyChat extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return MaterialApp (
      theme: ThemeData(primaryColor : Colors.teal, accentColor: Colors.green),
      title: "FriendlyChat",
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChatScreenState();
  }
  
}
class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = new TextEditingController();
  List<ChatMessage> _messages = <ChatMessage> [];
  void _onSubmitted (){
    ChatMessage message = new ChatMessage(_textEditingController.text , new AnimationController(duration: ));
    _textEditingController.clear();
    setState(() {
          _messages.insert(0 , message);      
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget _buildComposer (){
      return Row(
        children: <Widget>[
          Flexible (
            child: TextField(
            decoration: InputDecoration.collapsed(hintText: "Send a message"),
            controller: _textEditingController,
          ),
          ),
          ClipOval(
            child:Container (
            child : IconButton(
            icon: new Icon(Icons.send, color: Theme.of(context).accentColor),
            onPressed: () => _onSubmitted(),
          ),
          ),
          ),
        ],
      );
    }
    return Scaffold(
      appBar: new AppBar(
        title: Text ("WhatsApp"),
      ),
      body: Column(
        children: <Widget>[
          Flexible( child : ListView.builder(itemBuilder:(context, int index) => _messages[index], itemCount: _messages.length, reverse: true,)),
          Divider(height: 1.0, color: Colors.teal,),
          _buildComposer(),
        ],
      )
    );
  }
} 
class ChatMessage extends StatelessWidget{
  final String text;
  final AnimationController animationController;
  const ChatMessage(this.text, this.animationController);
  @override 
  Widget build (BuildContext context){
    return SizeTransition(
      sizeFactor: animationController,
      child: Container(
      margin:EdgeInsets.only(top: 8.0),
      child : Row (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(width: 8.0,),
          CircleAvatar (child: Text("E"), backgroundColor: Theme.of(context).primaryColor, foregroundColor: Colors.white,),
          SizedBox(width: 8.0,),
          Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            Text("Elbatoul Mazighi", style: new TextStyle(fontSize: 20.0),),
            SizedBox(height: 4.0,),
            Text(text, style: Theme.of(context).textTheme.subtitle,)
          ],)
        ],
    ),
    ),
    );
  }
}