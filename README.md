# nativescript-plugin-botjet

Unofficial plugin to integrate BotJet.ai Webbased native sdks into your nativescript projects.

## Installation

Describe your plugin installation steps. Ideally it would be something like:

```javascript
tns plugin add nativescript-plugin-botjet
```

## Usage 

Describe any usage specifics for your plugin. Give examples for Android, iOS, Angular if needed. See [nativescript-drop-down](https://www.npmjs.com/package/nativescript-drop-down) for example.
	
```javascript
import { BotJetSDK, BotJetConfig } from "nativescript-plugin-botjet";

const config : BotJetConfig =  { 
    clientId : "<--your client id-->",
    botId : "<!-- your bot id -->",
    title : "My Chat Bot",
    accentColor : "#323b8c",
    senderId : '<!-- logged in user specific keys-->'
}

BotJetSDK.launchChatWithConfig(config);
```
    
## License

Apache License Version 2.0, January 2004
