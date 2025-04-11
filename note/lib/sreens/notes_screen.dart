import 'package:flutter/material.dart';
import '../secure_storage.dart';
import '../widgets/note_card.dart';
import 'note_detail_screen.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<String> noteTitles = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final keys = SecureStorage.getAllKeys();
    setState(() {
      noteTitles = keys;
    });
  }

  Future<void> _deleteAll() async {
    final confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete All Notes?'),
        content: const Text('This cannot be undone. Proceed?'),
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
      await SecureStorage.deleteAllData();
      await _loadNotes();
    }
  }

  void _openNote({String? title}) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => NoteDetailScreen(noteTitle: title),
      ),
    );
    await _loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Secure Notes',
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever_outlined),
            onPressed: _deleteAll,
            tooltip: 'Delete All Notes',
          )
        ],
      ),
      body: noteTitles.isEmpty
          ? Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.note_add_outlined,
                      size: 64,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No notes yet',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[500],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Add your first note above',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: noteTitles.length,
              itemBuilder: (context, index) {
                final title = noteTitles[index];
                return FutureBuilder(
                  future: Future.value(SecureStorage.getData(title)),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return const SizedBox.shrink();
                    return GestureDetector(
                      onTap: () => _openNote(title: title),
                      child:
                          NoteCard(title: title, content: snapshot.data ?? ''),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 44, 197, 235),
        onPressed: () => _openNote(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
