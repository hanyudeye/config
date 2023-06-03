## 为什么要在 vscode 中 使用 sudo ？
为了编辑特权文件

sudo chown myuser /path/to/file
code /path/to/file
sudo chown root /path/to/file

## 键盘绑定 keybindings.json

```json
{
    "key": "alt+l",
    "command": "cursorRight",
    "when": "editorTextFocus"
  },
  {
    "key": "alt+h",
    "command": "cursorLeft",
    "when": "editorTextFocus"
  },
```
