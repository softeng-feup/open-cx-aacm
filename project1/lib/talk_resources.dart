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
  bool multiPick = false;
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
        //Multiple file
        if (multiPick) {
          _path = null;
          _paths = await FilePicker.getMultiFilePath(
              type: fileType, fileExtension: _extension);
          //info.resources.add(FilePicker.getMultiFile() as Resource);
        }
        //Single file 
        else {
          _paths = null;
          _path = await FilePicker.getFilePath(
              type: fileType, fileExtension: _extension);
            Resource r = FilePicker.getFile() as Resource;
            //info.resources.add(r);
        }
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
        body: 
          new Center(
            child: new Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: new SingleChildScrollView(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new DropdownButton(
                      hint: new Text('Type of resource'),
                      value: fileType,
                      items: <DropdownMenuItem>[
                        new DropdownMenuItem(
                          child: new Text('Audio'),
                          value: FileType.AUDIO,
                        ),
                        new DropdownMenuItem(
                          child: new Text('Image'),
                          value: FileType.IMAGE,
                        ),
                        new DropdownMenuItem(
                          child: new Text('Video'),
                          value: FileType.VIDEO,
                        ),
                        new DropdownMenuItem(
                          child: new Text('Any'),
                          value: FileType.ANY,
                        ),
                        new DropdownMenuItem(
                          child: new Text('Custom format'),
                          value: FileType.CUSTOM,
                        ),
                      ],
                      onChanged: (value) => setState(() {
                            fileType = value;
                            if (fileType != FileType.CUSTOM) {
                              _controller.text = _extension = '';
                            }
                          })),
                ),
                new ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 100.0),
                  child: fileType == FileType.CUSTOM
                      ? new TextFormField(
                          maxLength: 15,
                          autovalidate: true,
                          controller: _controller,
                          decoration:
                              InputDecoration(labelText: 'File extension'),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.none,
                          validator: (value) {
                            RegExp reg = new RegExp(r'[^a-zA-Z0-9]');
                            if (reg.hasMatch(value)) {
                              validMime = false;
                              return 'Invalid format';
                            }
                            validMime = true;
                            return null;
                          },
                        )
                      : new Container(),
                ),
                new ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 200.0),
                  child: new SwitchListTile.adaptive(
                    title: new Text('Pick multiple files',
                        textAlign: TextAlign.right),
                    onChanged: (bool value) =>
                        setState(() => multiPick = value),
                    value: multiPick,
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                  child: new RaisedButton(
                      shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Color(0xFF3EA6F2), width: 2.0),
                          borderRadius: BorderRadius.circular(20),
                      ),
                    onPressed: () => _openFileExplorer(),
                    child: new Text("Choose file"),
                  ),
                ),
                new Builder(
                  builder: (BuildContext context) => loadingPath
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: const CircularProgressIndicator())
                      : _path != null || _paths != null
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
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        new Divider(),
                              )),
                            )
                          : new Container(),
                ),
              ],
            ),
          ),
        )),

    );
  }
}
