import 'package:flutter/material.dart';
import '../secure_storage.dart';

class NoteDetailScreen extends StatefulWidget {
  final String? noteTitle;
  const NoteDetailScreen({super.key, this.noteTitle});

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    if (widget.noteTitle != null) {
      _loadNote();
    }
  }

  void _loadNote() async {
    _titleController.text = widget.noteTitle!;
    final content = await SecureStorage.getData(widget.noteTitle!);
    _contentController.text = content ?? '';
    _isEditing = true;
    setState(() {});
  }

  Future<void> _saveNote() async {
    if (_titleController.text.trim().isEmpty) return;

    if (_isEditing && widget.noteTitle != _titleController.text) {
      await SecureStorage.deleteData(widget.noteTitle!);
    }

    await SecureStorage.saveData(
      _titleController.text.trim(),
      _contentController.text.trim(),
    );
    Navigator.pop(context);
  }

  Future<void> _deleteNote() async {
    final confirm = await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete Note'),
        content: const Text('Are you sure you want to delete this note?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Delete', style: TextStyle(color: Colors.red))),
        ],
      ),
    );

    if (confirm == true) {
      await SecureStorage.deleteData(widget.noteTitle!);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Note' : 'New Note'),
        actions: _isEditing
            ? [
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: _deleteNote,
                )
              ]
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              color: const Color.fromARGB(255, 242, 247, 249),
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Title',
                  ),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Card(
                color: const Color.fromARGB(255, 242, 247, 249),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: TextField(
                    controller: _contentController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Content',
                      alignLabelWithHint: true,
                    ),
                    maxLines: null,
                    expands: true,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveNote,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[900],
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: const Text('Save', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),

      // body: Padding(
      //   padding: const EdgeInsets.all(20),
      //   child: Column(
      //     children: [
      //       TextField(
      //         controller: _titleController,
      //         decoration: const InputDecoration(labelText: 'Title'),
      //       ),
      //       const SizedBox(height: 16),
      //       Expanded(
      //         child: TextField(
      //           controller: _contentController,
      //           decoration: const InputDecoration(labelText: 'Content'),
      //           maxLines: null,
      //           expands: true,
      //         ),
      //       ),
      //       const SizedBox(height: 20),
      //       ElevatedButton(
      //         onPressed: _saveNote,
      //         style: ElevatedButton.styleFrom(
      //           backgroundColor: Colors.grey[900],
      //           padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      //         ),
      //         child: const Text('Save', style: TextStyle(color: Colors.white)),
      //       )
      //     ],
      //   ),
      // ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
