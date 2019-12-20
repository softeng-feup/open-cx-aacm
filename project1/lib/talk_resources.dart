import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:project1/objects.dart';
import 'info.dart';

class Upload extends StatefulWidget {
  //final AllInfo info;
  //Upload(this.info);

  @override
  _Upload createState() => new _Upload(/*info*/);
}

class _Upload extends State<Upload> {
  //_Upload(this.info);
  //AllInfo info;

  String fileName;
  String _path;
  Map<String, String> _paths;
  String _extension;
  bool loadingPath = false;
  bool multiPick = true;
  bool validMime = false;
  FileType fileType;
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  void _openFileExplorer() async {
    if (fileType != FileType.CUSTOM || validMime) {
      setState(() => loadingPath = true);
      try {
        _path = null;
        _paths = await FilePicker.getMultiFilePath(
            type: fileType, fileExtension: _extension);
        //info.resources.add(FilePicker.getMultiFile() as Resource);
      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }
      if (!mounted) return;
      setState(() {
        loadingPath = false;
        fileName = _path != null
            ? _path.split('/').last
            : _paths != null ? _paths.keys.toString() : '...';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resources"),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 30,),
      new Expanded(
          child: new Builder(
            builder: (BuildContext context) => _path != null || _paths != null
                    ? new Container(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        height: MediaQuery.of(context).size.height * 0.50,
                        child: new Scrollbar(
                            child: new ListView.separated(
                          itemCount: _paths != null && _paths.isNotEmpty
                              ? _paths.length
                              : 1,
                          itemBuilder: (BuildContext context, int index) {
                            final bool isMultiPath =
                                _paths != null && _paths.isNotEmpty;
                            final String name = 'File $index: ' +
                                (isMultiPath
                                    ? _paths.keys.toList()[index]
                                    : fileName ?? '...');
                            final path = isMultiPath
                                ? _paths.values.toList()[index].toString()
                                : _path;

                            return new ListTile(
                              title: new Text(
                                name,
                              ),
                              subtitle: new Text(path),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              new Divider(),
                        )),
                      )
                    : new Container(),
          )),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Color(0xFF3EA6F2),
            onPressed: () => _openFileExplorer(),
            child: Text('Add resource(s)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Colors.white)),
          ),
          SizedBox(height: 15,),
        ],
      ),
    );
  }
}
