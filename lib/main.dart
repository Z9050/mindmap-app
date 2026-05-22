import 'package:flutter/material.dart';
import 'package:flutter_mind_map/mind_map.dart';
import 'package:flutter_mind_map/mind_map_node.dart';

void main() {
  runApp(MindMapApp());
}

class MindMapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '法考思维导图',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('法考思维导图', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map, size: 80, color: Colors.green[700]),
            SizedBox(height: 20),
            Text('点击下方按钮创建思维导图',
                style: TextStyle(fontSize: 16, color: Colors.grey[600])),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditorPage()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green[700],
      ),
    );
  }
}

class EditorPage extends StatefulWidget {
  @override
  _EditorPageState createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  late IMindMapNode rootNode;
  final TextEditingController titleController = TextEditingController(text: '新建导图');

  @override
  void initState() {
    super.initState();
    rootNode = MindMapNode(id: 'root', content: titleController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: titleController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(border: InputBorder.none),
        ),
        backgroundColor: Colors.green[700],
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: () => Navigator.pop(context)),
        ],
      ),
      body: MindMap(
        rootNode: rootNode,
        onChange: (newRoot) => setState(() => rootNode = newRoot),
        theme: MindMapThemeNormal(),
      ),
    );
  }
}
