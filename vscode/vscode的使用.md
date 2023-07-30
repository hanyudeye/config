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

#snippet
{
	// Place your global snippets here. Each snippet is defined under a snippet name and has a scope, prefix, body and 
	// description. Add comma separated ids of the languages where the snippet is applicable in the scope field. If scope 
	// is left empty or omitted, the snippet gets applied to all languages. The prefix is what is 
	// used to trigger the snippet and the body will be expanded and inserted. Possible variables are: 
	// $1, $2 for tab stops, $0 for the final cursor position, and ${1:label}, ${2:another} for placeholders. 
	// Placeholders with the same ids are connected.
	// Example:
	"hugo header": {
		"scope": "markdown",
		"prefix": "hugoheader",
		"body": [
			"---",
			"layout: default",
			"title: ${1:title}",
			"date:  ${CURRENT_YEAR}-${CURRENT_MONTH}-${CURRENT_DATE}T${CURRENT_HOUR}:${CURRENT_MINUTE}:${CURRENT_SECOND}+08:00",
			"categories: ['${3}']",
			"---\n",
			"$0",
		],
		"description": "插入hugo头部"
	}
}