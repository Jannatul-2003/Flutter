import 'package:flutter/material.dart';
import 'secure_storage.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  List<String> notes = [];
  bool _isEditing = false;
  String? _deletedTitle;
  String? _deletedContent;

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final keys = await SecureStorage.getAllKeys();
    setState(() {
      notes = keys;
    });
  }

  Future<void> _saveNote() async {
    if (_titleController.text.isEmpty) return;

    await SecureStorage.saveData(
      _titleController.text,
      _contentController.text,
    );

    _cancelEditing();
    await _loadNotes();
  }

  Future<void> _deleteNote(String title) async {
    _deletedTitle = title;
    _deletedContent = await SecureStorage.getData(title);

    await SecureStorage.deleteData(title);
    await _loadNotes();

    // Show Modal Bottom Sheet after deletion
    _showDeletedNoteDetails(_deletedTitle!, _deletedContent!);
  }

  Future<void> _deleteAllData() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text(
            'Are you sure you want to delete ALL your data? This cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await SecureStorage.deleteAllData();
              await _loadNotes();
              Navigator.pop(context);
            },
            child:
                const Text('Delete All', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _startEditing(String title) {
    setState(() {
      _isEditing = true;
      _titleController.text = title;
      _contentController.text = SecureStorage.getData(title) ?? '';
    });
  }

  void _cancelEditing() {
    setState(() {
      _isEditing = false;
      _titleController.clear();
      _contentController.clear();
    });
  }

  void _showNoteDetails(String title, String content) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  // Modal Bottom Sheet for Deleted Note
  void _showDeletedNoteDetails(String title, String content) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Deleted Note',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Title: $title',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Content: $content',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Undo delete action
                    if (_deletedTitle != null && _deletedContent != null) {
                      SecureStorage.saveData(_deletedTitle!, _deletedContent!);
                      _loadNotes();
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                  ),
                  child: const Text('Undo Delete'),
                ),
                TextButton(
                  onPressed: () {
                    // Close the modal
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Secure Notes',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: _deleteAllData,
            tooltip: 'Delete All',
          ),
        ],
      ),
      body: Column(
        children: [
          // Input Card
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 14),
                  ),
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _contentController,
                  decoration: InputDecoration(
                    labelText: 'Content',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 14),
                  ),
                  maxLines: 3,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (_isEditing)
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          backgroundColor: Colors.grey[200],
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        onPressed: _cancelEditing,
                        child: const Text('Cancel',
                            style: TextStyle(color: Colors.black87)),
                      ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: _saveNote,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[600],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      child: Text(
                        _isEditing ? 'Update' : 'Save',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Notes List
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: notes.isEmpty
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
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        final title = notes[index];
                        final content = SecureStorage.getData(title) ?? '';

                        return GestureDetector(
                          onTap: () {
                            // Show the note details in a modal bottom sheet
                            _showNoteDetails(title, content);
                          },
                          child: Dismissible(
                            key: Key(title),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              color: Colors.redAccent,
                              child: const Icon(Icons.delete, color: Colors.white),
                            ),
                            confirmDismiss: (direction) async {
                              final shouldDelete = await showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Delete Note'),
                                  content: Text(
                                      'Are you sure you want to delete "$title"?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, false),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, true),
                                      child: const Text('Delete',
                                          style: TextStyle(color: Colors.red)),
                                    ),
                                  ],
                                ),
                              );
                              return shouldDelete ?? false;
                            },
                            onDismissed: (_) => _deleteNote(title),
                            child: Card(
                              elevation: 3,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              margin: const EdgeInsets.only(bottom: 12),
                              child: ListTile(
                                title: Text(
                                  title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  content,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                                trailing: PopupMenuButton<String>(
                                  onSelected: (value) {
                                    if (value == 'edit') {
                                      _startEditing(title);
                                    } else if (value == 'delete') {
                                      _deleteNote(title);
                                    }
                                  },
                                  itemBuilder: (context) => [
                                    const PopupMenuItem(
                                      value: 'edit',
                                      child: Text('Edit'),
                                    ),
                                    const PopupMenuItem(
                                      value: 'delete',
                                      child: Text('Delete'),
                                    ),
                                  ],
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  color: Colors.white,
                                  elevation: 4,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: notes.isNotEmpty
          ? FloatingActionButton(
              onPressed: () {
                _cancelEditing();
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Scrollable.ensureVisible(
                    context,
                    alignment: 0,
                    duration: const Duration(milliseconds: 300),
                  );
                });
              },
              backgroundColor: Colors.blue[600],
              child: const Icon(Icons.add, color: Colors.white),
            )
          : null,
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
